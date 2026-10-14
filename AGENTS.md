# AGENTS.md — AI Operating Manual for this Repository

*Last updated: 2026-09-18 · Framework: Dr. Richard K. Bernstein · T1D blood-sugar + insulin log*

## 1. Project in one line

A real-time AI analysis partner for a 40-year-old T1D (ketogenic / intermittent-fasting, HbA1c 4.6–5.3%) who logs blood-sugar readings, insulin doses, food, and mental state in `bloodsugar.md`, and needs dose advice, alarm handling, and memory continuity across sessions.

## 2. Mandatory startup read order (every session, in this order)

1. **`session_state.md`** — the live handoff: today's status, active insulin, HAAF flag, strip budget, open alarms, handoff notes. Read this FIRST.
2. **`README.md`** — the notation cipher (finger indices, `{dose}` syntax, food/event codes, ISF tables, insulin PK). You cannot read the log without this.
3. **`bloodsugar.md`** — tail of the log for current-days entries (`tail -n 200`).

Do not assume protocol details from memory — READ the files. They are the source of truth.

## 3. Core operating rules (condensed — read README for full context)

- **Reply concise and condensed.** Short paragraphs, no padding. The user's screen tolerance is low.
- **Mental issue first, diabetes second.** Agitation, violent imagery, inability to concentrate at *normal* BG = brain-insulin pulsatility gap or neuroglycopenic aftermath → 1–2R immediately, or salt water if "not right" at normal BG.
- **Violent thinking on a rising BG (user's observation, unverified):** violent thinking often occurs when BG is rising into 100–150 mg/dL → insulin is needed to bring it down into the stable 70–100 safe zone. Log tally 2026-02→10-12 (12 notes with a BG): <100 ×4 (33, 86, 94, 96), 100–150 ×4 (105, 107, 111, 142), >150 ×4 (152–166) — the signal clusters on rising/high BG. Keep logging `<!-- violent thinking -->` with the BG so this can be confirmed or revised.
- **Never dose for current BG — dose for projected BG at insulin peak.** Projected = current + (rise rate × time to peak). Rising → more aggressive; falling → more conservative.
- **Post-hypo <24h = reduce every dose by severity (not a flat half).** HAAF + empty glycogen + tissue sensitization make insulin hit ~1.3–2× harder, scaling with how deep/repeated the low was. Compute the normal dose (projected-BG math), then multiply:

  | Worst low in last 24h | 0–12h after | 12–24h after |
  |---|---|---|
  | 54–69, single, felt it | ×0.75 | ×0.9 |
  | 40–53, or unaware ("feeling ok") | ×0.6 | ×0.75 |
  | <40, or ≥2 lows <54 in 48h | ×0.5 | ×0.6 |

  Round down to ½u. **Culprit slot:** the dose that preceded the low (e.g. evening/bedtime I before a wake low) also gets −1–2u at its next use, per low, until a low-free day. Non-negotiable — **except the morning shot on waking** (high insulin resistance after waking; dawn bands, no reduction — low end if an I tail is still active).
- **NPH (I) is compressed:** your duration 4–7h (not textbook 12–18h). Behaves like 1.5× potent R. Never inject I overnight, never at BG <90, never stacked with active R tail.
- **Avoid hypoglycemia above all.** Correct on waking rather than over-dosing before bed.
- **The morning insulin shot is critical for the whole day's benefits** (user's key observation). It sets BG, ketone safety, and mental clarity for the entire day. Example 20261008Thu: no morning shot after waking at 61 → 189 by 12:03, DKA risk, "今日狀況極差" all day. **Never skip it.**
- **Morning dawn-phenomenon H on waking** (never wake-and-wait): dawn rise +5/h clean, morning-H ISF ≈ 10–12/u. Bands (wake BG → H, target ~85): 70–100 → 1–2H; 100–120 → 2–3H; 120–150 → 4–5H; 150–180 → 6–7H; >180 → (BG−85)/11 cap 8H. R 1:1 substitute. Full derivation: `documents/morning_dawn_H_rule.md`.
- **Morning coffee rise:** caffeine (鹽BC / cf.) + morning cortisol ≈ +10–30 mg/dL at 30–90 min; small after a night low. Fat/MCT/salt ≈ 0 BG. Already covered by the morning-H bands (no extra units). 鹽BC is never hypo treatment — glucose first at <70. Unverified on this log; confirm with the 1h post-鹽BC check.
- **The two pre-bed checks** (1–2h before bed + at bed moment) are critical and non-negotiable — they set the overnight basal.

## 4. How to log data (EDIT `bloodsugar.md`)

- Append to the current day's section (`#### YYYYMMDD` header format).
- BG reading format: `<HH:MM> <value>mg/dL<finger-index>`. Finger indices: ¹-⁰ right-to-left thumbs; ₁-₀ nail-side. See README table.
- Dose format: `-`{`HH:MM` `units`+insulin `<`site`}``. Sites: `>B` right belly, `<B` left belly, `>A` right arm, `<A` left arm, `>T` right buttock, `<T` left buttock, `>内` right inner-thigh, `<内` left inner-thigh.
- Food/events in `[ ]` / `〘〙` per README codes (`[鹽BC]` salt bulletproof coffee, `[ch.]` cheese, `[ps.]` pumpkin seeds, `[ml.]` milk powder, `〘睡〙` back-to-sleep, `〘weigh〙` weigh-in).
- Mental/physical notes as `<!--...-->` on the relevant line (e.g. `<!-- 10:57 violent thinking-->`).
- Preserve existing entries; never rewrite history. Use the Edit tool with exact-match strings.

## 5. Dose-advice workflow

1. Read current BG + all active insulin (types, units, injection times) from the log tail.
2. Compute where each insulin is in its compressed PK curve (H peak 0.5–1.5h, R 1.5–2.5h, I 2–4h).
3. Consider today's context: HAAF flag? eating/fasting day? strip budget? time of day (dawn?).
4. Propose a dose with the peak math shown. If the user's proposal is riskier than warranted, say so clearly and give the safer option — but respect the user's final autonomy once stated.

## 6. Tools reference

- **Peak-check predictor** — `documents/predict_next_check.sh`
  ```bash
  bash documents/predict_next_check.sh "<HH:MM dose-time>" "<units+insulin>" "<currentBG>"
  ```
  Returns the ONE peak check to test at, not hourly. Validated against real crashes (14:11 4I → peak 17:11, real 17:07).
- **Alarm playbook** — `documents/bg_alarm_playbook.md`
  - DeskClock intent (system alarm) + background bash script (mp3 + vibrate, 3 rounds).
  - Taiwan voice = **`edge-tts --voice zh-TW-HsiaoChenNeural`** (Microsoft neural, verified best 09/18). Pre-generate MP3s into `audio/` with `documents/../audio` (see `/data/data/com.termux/files/usr/tmp/opencode/gen_bg_warnings.sh`). Alarm scripts only play the MP3 — no live TTS.
  - Do NOT use Google TTS `termux-tts-speak` for alarms (gave China accent).
  - Known bugs: `termux-notification` HANGS (~2min) — never call it; `termux-vibrate -d` takes ONE integer only.
  - Launch pattern: `setsid bash script.sh < /dev/null > log 2>&1 & echo ok-$!` then verify `/proc/<pid>`.
- **Strip budget** — `documents/strip_reduced.md`: calm day 3/day (pre-bed −2h, bed moment, wake); heavy-dose night +1 peak check; symptoms always override budget.
- **NPH/liver lesson** — `documents/fasting_NPH_liver_20260917.md`: why fasting NPH crashes (non-linear, not subtraction), gap-dosing table, post-hypo reduction.
- **Insulin totals** — `insulin_daily_dosage.md`: all months' daily units (N/H/R/I/T) + monthly summary; append each new month. (Older per-month files `2026MM_insulin_totals.md` remain.)
- **Strip totals** — `totals_stripe_combined.md`: daily strip counts by month + summary; append each new month.
- **Protocol summary** — `protocol_summary_20260324.md`: the brain-insulin-pulsatility framework, evening/sleep protocol, HAAF recovery.
- **Other scripts**: `bloodsugar_duration_termux.bash` (insulin duration count), `bloodsugar_meal-photo.pl` (photo insertion), `opencode-cli.pl` (terminal CLI colorizer), `Un-clip.pl` (keyboard clipboard).

## 7. Alarm setup quick reference

When the user asks for a BG/alarm warning at time T:
1. `date '+%H:%M'`; compute `sleep = $(date -d "T" +%s) - $(date +%s)`.
2. Send DeskClock intent (playbook §2) — covers wakeup.
3. Write voice script from playbook §3 template (vibrate → mp3 only, NO termux-notification, NO live TTS).
4. Launch detached with `setsid`, verify `/proc/<pid>/cmdline` exists.
5. Tell user: clock message + voice rounds + what to do at ring.
6. Pick nearest edge-tts MP3 from `audio/` (`bg_warn5.mp3` for hypo-watch, `nph_*.mp3` for NPH slots).

## 8. Session end / handoff (MANDATORY before switching models or ending)

1. Offer to (or directly) refresh `session_state.md` with:
   - today's date, BG summary, active insulin, HAAF flag, strip budget used, mental state
   - open alarms/checks, any ongoing plan, warnings to carry forward
2. Confirm the file was updated so the next model resumes cleanly.