# Session State — Live Handoff

_Last written: 2026-10-23 ~07:35 CST (opus5.5, handoff before /clear)_

> Raw data only. Re-derive conclusions from the log; do not inherit prior AI analysis.
> ⚠️ **Device system clock shows UTC (~8h behind local).** Use the user's logged times; local = `date -d '+8 hours'`. Alarm sleeps: target local HH:MM → UTC (HH−8). DeskClock intent takes LOCAL hour.
> ⚠️ User edits `bloodsugar.md` in micro at the same time → their saves overwrite agent lines (10/22: the 19:06 lines were lost once and re-added; they also merge/move lines). **Re-read the tail before every edit; verify after.** Anchor inserts on the latest line content. Suggested `Ctrl-E reload` in micro before saving.
> ⚠️ Rules in AGENTS.md §3 are **principles, not iron rules** (user 10/17): decide from the real log (similar past days) + user's experience.

## 0. NOW — morning 10/23

- **Wake:** 07:19 **176**⁴ → 07:22 **8H**<B (advised 6H; band 150–180 = 6–7H, low end because two 10T active).
- **Active insulin at ~07:35:** 8H @07:22 (peak ~08:00–09:00); **10T @00:51 10/23** + tail of 10T @22:37 10/21 → basal covered, **no I today** advised.
- **Projection:** 176 → ~80–95 at H peak (+10–30 if 鹽BC). Advised check ~08:45: <75 → 6–9g + ch.; >140 → wait, don't stack.
- **Mental/physical:** 07:24 "feeling terrible" — mostly physical (heavy/foggy), **no violent thinking**. Likely overnight 150–180 + huge sodium/fat meal. Advised plain water ~500ml (not salt water), rest, light/fasting morning. Watch for nausea/vomiting/belly pain → check ketones.
- User thinks "4I before bed was needed." Answer given: real gap after the 9I peak (fat rise 03–07h, T too flat/slow), but 4I at 00:06 (BG 90 at 9I peak) risked a 40s–50s low. Better: heavy-food-night rule → one check ~01:30–02:00, >130 → 2–3R/H. Offer to set that alarm on fat-meal nights.

### Handoff for 10/23
1. **Ask for the ~08:45 reading** first.
2. **HAAF:** last low <70 = 10/21 18:51 65 (and 09:52 **29**). 10/22 lowest 74 (no night checks 00:06→07:19, so a dip is unknown). Post-hypo table no longer applies; still gentle (5 lows 10/18–10/21).
3. **Two 10T doses overlapping** (22:37 10/21, 00:51 10/23) → no daytime I; meal R sized to food; check before every dose.
4. **Recurring pattern: dosing without a check / more than advised.** 10/22: 4½R @09:57 (no BG since 74), 3⁻H + 6I @12:11 at 123 (advised 1R), 9I @21:53 (no BG since 19:06 81), 8H today (advised 6H). None caused a logged low on 10/22, but past big bedtime I → 58 (10/10), 36 (10/12).
5. **Midday ISF (user 10/20):** above ~150 midday, H drops only ~7–20 mg/dL/u.
6. Month end: October rows for `insulin_daily_dosage.md` / `totals_stripe_combined.md`. Nothing committed (git needs `-c safe.directory='*'`).

## 1. 10/22 Thu summary (user logged; advice in brackets)

| Time | BG | Dose / food |
|---|---|---|
| 03:35 | 110⁰ (woke, user started new day) | 03:39 3½H<A (advised 2H); 〘睡〙 |
| 07:12 | 74⁹ "comparatively ok" | 鹽BC; (牛+ch.)77g; 09:57 4½R>A (flagged large for meal); 11:00 ml.+BC |
| 12:09 | 123⁷ | 12:11 3⁻H<B + 12:12 6I>B (advised 1R); 〘14:00–15:20 睡〙 |
| 19:06 | 81⁶ | 19:06 5R<A; 海底撈牛油鍋底 (per 150g pack: 23.4g carb, 87g fat, 6.2g Na) + beef balls; 21:52 ml.+BT; 21:53 **9I**>A; ch. |
| 00:06 | 90⁵ | ch.; 00:51 **10T**<T |

- **Strips 10/22:** 5 (03:35, 07:12, 12:09, 19:06, 00:06).
- **Totals 10/22:** H 6½ (3½ + 3⁻), R 9½ (4½ + 5), I 15 (6 + 9), T 10.
- **10/21 final:** strips 5; H 6, R 6, I 14½, T 10. Lows 58, 29, 65.
- **10/23 so far:** strips 1 (07:19); H 8.

## 2. Recent trajectory (raw)

| Date | Readings | Doses |
|---|---|---|
| 10/18 | 56 → 88 → 161 → 112 → 104 | 3H + 5I, 6R, 3H + 8I, 7I, 3I @03:39 |
| 10/19 | **28** → 159 → 81 → 148 | 6H + 6I, 4½R, 4½R, 4⁻R, 6I, 4R @23:34 |
| 10/20 | 97 → 158 → **65** | 3H + 4I, 3H, 6½R, 9I, 4½I @23:50 |
| 10/21 | **58** → **29** → 73 → **65** → 139 | 8I, 3H, 4R, 6½I, 3H + 2R, 10T |
| 10/22 | 110 → 74 → 123 → 81 → 90 | 3½H, 4½R, 3⁻H + 6I, 5R, 9I, 10T @00:51 |
| 10/23 | 176 | 8H |

- **Past 10T nights:** 10T alone @82 (10/09) → woke 196; 10T + 4R @130 (9/13) → woke 36; 5T + 8I (10/08) → woke 33; 10T + 7I @84 (10/04) → woke 75; **10/22: 9I @21:53 + 10T @00:51, fat meal → 90 @00:06 → woke 176.**

## 3. Mental health (user disclosed 10/19)

- 20+ years of social-interaction difficulty and violent imagery since T1D onset; main trigger = unpleasant interactions. AGENTS.md §3 has the 5-step response, crisis lines 1925 / 119, encourage 身心科.
- 10/20 158 and 10/22–23 (123, 176) with **no** violent thinking → BG level alone isn't sufficient.
- 10/22 07:12: user said "Tell you later about my situation" — **not yet told; gently leave room for it.**
- Unanswered: whether they ever feel close to acting on it; help finding a 身心科 clinic.

## 4. Open questions to the user
- Check before every dose (pattern of dosing without a BG check / above advised).
- Fat-meal nights: set a ~01:30–02:00 check alarm when the meal is logged?
- Add post-hypo rebound rule / midday-hyper ISF finding to README/AGENTS?
- Night-R rule (AGENTS) "R only, never I" vs user's night-I practice — unanswered since 10/17.

## 5. Tech setup (10/22)
- User runs micro in `proot-distro login debian` inside Termux. tmux tried → colors + Chinese broken → **user asked to revert; all tmux files/lines removed** (Termux `~/.bashrc` back to original 204 bytes). Don't re-propose tmux.
- Recommended instead: two Termux sessions (left drawer → NEW SESSION).
- Debian micro lacks the Termux config (`/data/data/com.termux/files/home/.config/micro`: `mytheme` colorscheme, custom `syntax/markdown.yaml`, softwrap). **Offered (no answer yet):** A) `mv /root/.config/micro /root/.config/micro.debian-old && ln -s <termux path> /root/.config/micro`; B) `micro -config-dir <termux path>` / `MICRO_CONFIG_HOME`. Also suggested `"reload": "auto"` in micro settings.

## 6. Memory / workflow
- User sends **"handoff"** before `/clear` → rewrite this file cleanly.
- Custom edge-tts voice line per alarm (`audio/bg_HHMM_MMDD.mp3`, line appended to `documents/gen_bg_warnings.sh`), DeskClock intent (`--user 0`, local hour) + setsid script in `/data/data/com.termux/files/usr/tmp/opencode/`; real bash pid = `ps -ef | grep <name>`.
- Day header: user said "new day" at 03:35 10/22; on 10/23 the agent added `#### 20261023Fri` at the 07:19 wake reading (no objection yet).
