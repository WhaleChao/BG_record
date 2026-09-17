# BG & Insulin Alarm Playbook (Termux, reusable)

*Last updated: 2026-09-17 · tested on RedmiNote10s + Termux + Termux:API + Google TTS (cmn-TW downloaded)*

## 1. Two alarm layers (use both)

| Layer | What | Covers |
|---|---|---|
| DeskClock (`com.android.deskclock`) via intent | Loud system alarm + message text | Wakes you even if Termux sleeps |
| Background bash script | `bg_warn*.mp3` + vibration + Taiwan TTS voice, 3 rounds | Tells you *what to do* (check BG, eat glucose, dose rule) |

## 2. DeskClock alarm (system clock)

```bash
# 20:30 hypo-watch
am start -a android.intent.action.SET_ALARM \
  --ei android.intent.extra.alarm.HOUR 20 \
  --ei android.intent.extra.alarm.MINUTES 30 \
  --es android.intent.extra.alarm.MESSAGE "量血糖！5I高峰 hypo watch" \
  --ez android.intent.extra.alarm.SKIP_UI true
```

- First use per ROM may need DeskClock opened once to confirm.
- Verify verbally with user ("it is set correctly") — no reliable CLI readback.

## 3. Voice warning script (template — use this, not the old ones)

```bash
#!/bin/bash
# hypo_2130_0917_fix.sh — TEMPLATE
sleep 3375   # = target_epoch - now_epoch; compute: $(date -d "21:30 today" +%s) - $(date +%s)
termux-wake-lock 2>&1
for i in 1 2 3; do
  termux-vibrate -d 1000 2>&1
  termux-media-player play /storage/emulated/0/Documents/github/BG_record/audio/bg_warn5.mp3 2>&1
  echo "九點半了，量血糖。五個NPH正在高峰，低血糖風險最高。低於九十馬上吃葡萄糖粉，不要睡著。" \
    | termux-tts-speak -e com.google.android.tts -l cmn -n TW -s ALARM 2>&1
  sleep 60
done
```

Launch detached + verify:

```bash
chmod +x script.sh
setsid bash script.sh < /dev/null > script.log 2>&1 & echo ok-$!
sleep 3; ls /proc/<pid>/cmdline   # exists = running
```

Kill a stuck loop:

```bash
kill <bash_pid> <sleep_pid>
```

## 4. TTS cheat-sheet (Taiwan Mandarin, speaker output)

```bash
# One-liner test / manual warning
echo "請量血糖" | termux-tts-speak -e com.google.android.tts -l cmn -n TW -s ALARM

# Generic Mandarin fallback (no TW voice pack)
echo "TEXT" | termux-tts-speak -l zh -n TW -s ALARM
```

- `-s ALARM` routes to alarm stream (heard even in silent-ish modes).
- Engine must be explicit: `-e com.google.android.tts`, lang `cmn`, region `TW`.

## 5. Ready-made warning lines (copy/paste)

| Situation | Chinese (TW) line |
|---|---|
| Bed-peak (16I+1R) | 三點半了，起來量血糖。你打了十六個NPH加一個R，現在是胰島素高峰，小心低血糖。開燈量血糖，低於九十馬上吃葡萄糖粉，不要回去睡。 |
| NPH window, must eat first | 一點半了，先量血糖再打NPH。一定要高於九十而且有吃東西才能打，空腹不可打。先吃肉或起司，葡萄糖粉放旁邊。 |
| Hypo-watch peak | 八/九點半了，(起來)量血糖。五個NPH正在高峰，低血糖風險最高。低於九十馬上吃葡萄糖粉，坐著量。 |
| Plain prompt | 請量血糖。 |

## 6. Audio files (`audio/`)

- `bg_warn1–5.mp3` — BG check warnings (warn5 = default for hypo-watch)
- `bg_0630/1400/1500.mp3` — time-based BG reminders
- `nph_0900/1250/1430/1836/2045.mp3` — NPH-slot reminders (pick nearest slot: 13:30 window → `nph_1430.mp3`)

## 7. Bugs found 2026-09-17 (do NOT regress)

1. **`termux-vibrate -d 1000,500,...` FAILS** — this termux-api build accepts one integer only (`Error: For input string`). Use `-d 1000` and loop if needed.
2. **`termux-notification` HANGS (~2 min block)** in this Termux — any script calling it stalls *before* mp3/TTS. Voice scripts must NOT call it (DeskClock covers the visual). Order: vibrate → mp3 → TTS.
3. **Stuck loops accumulate** (`bash` + `sleep` + `sh/termux-api` stay in `ps`) — kill old `<pid>`s after they fire; check `ps` before launching a same-slot replacement.
4. **`setsid ... &` + `echo ok-$!` is the launch pattern that returns fast**; `nohup` and chained `termux-notification` in the same one-liner block the tool call to timeout.

## 8. New-session checklist

1. `date '+%H:%M'` + `tail -n 8 bloodsugar.md` (current BG, active insulin, now-time)
2. Compute `sleep = target_epoch − now_epoch`
3. Send DeskClock intent (section 2)
4. Write script from template (section 3) with warning line (section 5) + mp3 (section 6)
5. Launch + verify via `/proc/<pid>` (section 3)
6. Tell user: DeskClock message + voice rounds + what to do at ring (BG first, dose rule, glucose bedside)
