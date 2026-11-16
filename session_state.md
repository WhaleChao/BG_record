# Session State — Live Handoff

_Last written: 2026-11-16 08:50 local (grok4.7, 鹽BC)_

> Raw data only. Re-derive conclusions from the log; do not inherit prior AI analysis.
> ⚠️ **Two log files (user 11/08, comment file 11/12):** `bloodsugar.md` = user data + user comments only, **no AI comments**; `bloodsugar_grok.md` = same data + AI comments (replaces `bloodsugar_claude.md`, which is not on disk). Write every new entry to both; read `bloodsugar_grok.md` for context; copy user-only additions from `bloodsugar.md` into it (user edits `bloodsugar.md` in micro). AI comments: `<!-- grok4.7: ... -->` only in `bloodsugar_grok.md`.
> ⚠️ **Line layout (user 11/12):** food and notes go on the existing BG or dose line (`[HH:MM text]`, `<!-- HH:MM note -->`). No new ` - HH:MM [food]` or ` - HH:MM <!-- note -->` line. Full rule in AGENTS.md §4.
> ⚠️ **Device system clock shows UTC (~8h behind local).** Local = `date -d '+8 hours'`. **Always use it for log times.** DeskClock intent takes LOCAL hour. Script sleep: `TGT=$(date -d "$(date -d '+8 hours' +%F) HH:MM" +%s); NOW=$(date -d '+8 hours' +%s)`; for after-midnight targets use `+32 hours` in the inner date — **don't use "HH:MM +1 day"**.
> ⚠️ **Check the local clock on every message** — replies arrive hours apart (11/08: "57" sent 10:24, "42" at 18:20, "188" at 14:12). Log at the real time.
> ⚠️ **Don't `pkill -f <pattern>`** — kills the agent's own shell. Use `kill <pid>` from `ps -ef | grep '[b]ash /data.*bg_'`.
> ⚠️ **`grep` is a shell function wrapping the claude binary and fails → use `/bin/grep`.**
> ⚠️ Re-read both tails before every edit; verify after. `printf` with fewer `%s` than args repeats the line — count them (11/08 duplicate fixed).
> ⚠️ **git:** repo needs `git -c safe.directory='*' …` (dubious ownership). `gh` logged in as louisophie + `gh auth setup-git` done 11/10 → push works. DNS was flaky 11/10 (curl/gh "could not resolve"); retry later.
> ⚠️ Rules in AGENTS.md §3 are **principles, not iron rules** (user 10/17).

## 0. NOW — written 08:50 11/16

- **Last BG:** 11/16 08:32 **102**₂, then 08:35 **3½H<B**[08:50 鹽BC]. Under `#### 20261116Mon`. Before that 06:10 **57**₃[cin.鹽BC]<!-- 08:15 violent thinking -->. No glucose logged. 57 → 102 in 2h22m, +45.
- **On board:** 08:35 **3½H<B**, peak ~09:35, runs to ~11:30. 00:35 **(8+8)T>内<T** = 16T, flat. 11/14 22:32 **(8+8)T<内>T** is ~34h and may still overlap. No I.
- **Compare:** 11/14 22:32 <内>T at 73 → 04:14 **102**. This 00:35 >内<T at 64 → 06:10 **57**.
- **Post-hypo:** 57 is 54–69. **×0.75 until ~18:10 11/16**, ×0.9 until ~06:10 11/17. The 49 (40–53) is still ×0.75 until ~16:30. Morning shot is not cut by that table. Low end once ≥70 and not falling. Culprit of the 49 = the 12:12 7I. The 58 followed the 18:22 3⁻I. Next use of that evening-I slot: −1–2u until a low-free day.
- **Food 11/15:** 07:40 鹽BC. 10:22 泡麵 52g starch. 12:15 鹽BC. 14:45 cin.鹽BC. 16:37 7.7g. 22:01 6.4g.
- **Mental:** 08:15 violent thinking, no trigger, on the 06:10 57 line. Next BG 08:32 was 102. "Might act" was not said.
- **Now:** 08:50 鹽BC, second coffee, on the 3½H line. Fat/salt ≈ 0. Caffeine ~09:20–10:20 sits on the 09:35 peak, so that check can read a little above 70–82. No extra insulin. Peak check **09:35** only. <70 → 8–10g. No I. No more T. Glucose bedside. Aim remains 60–80.
- **Strips:** 2 on 11/16 (57, 102). 11/15 was 8, plus the 00:12 on that header.
- **Remote:** hub :2421 / agent :2419, autostart false. Tailscale tun0 `100.105.20.120`. Phone browser: `http://127.0.0.1:2421`. Grokbot cannot open 100.x or 10.x. This chat is text.
- **Open alarms:** none.

## 1. 11/11 Wed (log day 04:49 11/11 →)

| Time | BG | Dose / food |
|---|---|---|
| 04:49 | 130₁ (wake) | 04:52 **3H>A** 〘睡〙 |
| 07:51 | 93¹ | 08:03 cin.鹽BC; 08:08 **2½H** (adv. 1H); cin.鹽BC |
| 10:18 | 74² | (adv. 1I, not taken) |
| 12:45 | 91³ | violent thinking 12:44; 12:50 **0.6H0.4R<B** (diluted); 14:00 鹽BC |
| 15:30 | 83⁴ | violent thinking 13:25 (no BG); 15:40 **1I>B** |
| 18:02 | 99⁵ | 18:12 **1I<A**; 18:55 鹽BT(cf.少) |
| 20:39 | 121⁶ | 20:47 **1.0H>A** (diluted; adv. 1N); 21:07 鹽 |
| 22:37 | 94⁷ | 22:46 **1I>内** |
| 00:02 | 94⁸ | 00:09 **7T>内 + ½I<T** |

- **Strips:** 9. **Totals:** H ~7.1, R 0.4, I 3½, T 7. Glucose 0.
- **No lows today.** Fasting gap rise ~+7–9/h; 1I ≈ only −15–25 net on a fasting day (83 → 99 → 121 with 2I). Saline-diluted 1.0H worked ~full strength (121 → 94).
- fu.: none after the 11/10 pork (user).

## 1b. 11/12 Thu (from 05:23)

| Time | BG | Dose / food |
|---|---|---|
| 05:23 | 47⁹ (wake) | cin.BC; 06:10 cin.鹽BC; 07:14 鹽BC. No glucose |
| 07:29 | 70⁹ | violent thinking 07:26 (between 47 and 70); 07:50 **1.2H<B** |
| 10:55 | 66⁰ | H finished. No dose yet |
| 12:38 | — | 〘(W+Bike)₁〙[鹽cf.] |
| 14:20 | 114⁰ | 14:23 **1.0H>B** + 14:24 **1I<A** (adv. ½H) |
| 17:40 | 107⁹ | H done. 1I still in peak. −7 in 3h20m |
| 17:47 | — | **0.6H>A** + 17:49 **0.8I<B** (months-old diluted NPH, effect/timing unknown) |
| 18:25 | — | violent thinking |
| 18:34 | 98⁸ | 107 → 98 (−9). H still in peak |
| 19:32 | — | [冰炸豬油+鹽(有肉渣沬)] on the 98 line |
| 20:40 | — | violent thinking, on the 98 line |
| 21:18 | 91⁷ | [22:07 鹽BC(cf.少)]. 98 → 91 (−7) |
| 23:12 | — | violent thinking, on the 91 line. User: terrible day, thoughts surging |
| 23:22 | 95⁶ | 23:28 **5T<T** + 23:30 **0.5I>B** (asked 1I or 2I; advised neither; ceiling was ½I slow-site) |
| 01:29 | — | violent thinking, on the 0.5I line. No BG |

- **Strips:** 8. **Totals:** H 2.8, I 1 + 0.8 old + 0.5, T 5. Glucose 0. Wake low 47. No second logged low. 02:00 check not logged.
- Dawn trial 11/11 **scored low:** pre-bed 94/94, 1I>内 @22:46 + 7T>内 + ½I<T @00:09, fasting → wake 47.

## 1c. 11/13 Fri → 11/14 Sat (raw)

| Time | BG | Dose / food |
|---|---|---|
| 07:37 | 145⁵ (wake) | 07:43 **5H<A**, violent thinking, 鹽BC |
| 09:29 | 101⁴ | 09:32 **0.9H>A** |
| 11:40 | 59³ | "much better"; cin.鹽BC (chose cf. over glucose) |
| 12:59 | — | **0.5H<B** + 13:00 **0.8I>B**. User at 16:20: both already finished (H before ~15:20, I nearly done at 3h20m). Do not use the flat 4h/7h tails on these small doses |
| 16:14 | 66² | violent thinking 17:11 and 18:42; 17:26 鹽BC(cf.少); 19:04 broccoli+lard; 19:10 salted cashew **200g** |
| 19:26 | 111¹ | 19:28 **5H<A** (adv. 0.5H, or 1H if more than one handful) |
| 21:03 | — | **10H>A** + 泡麵 60g starch. No BG between 111 and 190 |
| 21:56 | 190₁ | 21:58 **10H<B** (adv. hold); 23:18 ml. |
| 23:43 | 131₂ | falling. 23:45 **3R>A**, 23:46 **7I<B** (same belly as 21:58 10H), 23:47 **10T>T** |
| 00:01 / 00:38 | — | serious violent thinking, then again. No new BG, no trigger |
| 02:39 | 170₂ | rose through the 3R peak. 02:41 **7H>B** (adv. hold until ~03:45) |
| 06:37 | **25**₃ | 〘睡〙. 06:43 10g, later removed from the line |
| 08:46 | 101⁴ | 08:49 **3H<A** [鹽BC]. No BG after this as of 11:22 |

- **11/13 strips:** 8 (145, 101, 59, 66, 111, 190, 131, 170). **11/14 strips so far:** 2.
- **11/13 doses actually taken:** H 5+0.9+0.5+5+10+10+7, I 0.8+7, R 3, T 10.
- Fast count that morning was day 3 if the 11/10 pork sediment is skipped (clock from 豬(少) 19:29 on 11/10). Cashew 200g plus 60g starch ended it.

## 2. Bedtime review

| Night | Pre-bed | Bedtime insulin | Wake |
|---|---|---|---|
| 11/04 | 77 unfed | 6T + 2I>T @02:30 | 84 |
| 11/05 | 118 falling | 8T + 5I>B | **37** |
| 11/06 | 68 → 88 | 9T>内 + 2⁺I<T | 64 |
| 11/07 | 83 | 8T<A + 2½I>T | 116 → 180 |
| 11/08 | 97 | 7T>B + 2I<T | 122 @03:20 (pork) |
| 11/09 | 87 | 4T>T (+2½I @19:43, 1½N @20:04) | 70 @04:05 |
| 11/10 | 90 @22:46 | 7T<内, no I (pork @19:29) | 130 @04:49 |
| 11/11 | 94 / 94 | 1I>内 @22:46 + 7T>内 + ½I<T @00:09, fasting | **47** @05:23 |
| 11/12 | 95 @23:22 | 5T<T @23:28 + 0.5I>B @23:30, fasting, post-47 | **145** @07:37 |
| 11/13 | 131 @23:43, falling | 3R>A + 7I<B + 10T>T, then 02:41 7H>B at 170 | **25** @06:37 |

## 3. Patterns / carry-forward

1. **Doses above advice, stacked, no BG between** (11/10 2½R + 2H at 70 → 38; 11/11 2½H vs 1H at 93 → 74, ok).
2. **Hypo unawareness** (42 felt ok 11/08; 38 with violent thinking only) → meter, CGM.
3. **Rebound after lows** (57 → 188, 38 → 127). Glucose ~+50 per 10g incl. rebound; at ~40 → 12–15g, 5g steps.
4. **Fasting days:** gap rise +7–15/h; steady 60–70 ok when insulin nearly done (user, 11/10). 11/13 user: fasting range is 60–90, and longer fasts sit lower. At 59 with 0.9H still active they chose cf. over glucose. The 60–70 allowance is for insulin finished. 11/12 user: fasting 90–100 acts like eating-day 100–150 for violent thinking. Evening 11/12 was 98 / 91 / 95 with repeated thoughts. Test, do not treat as settled.
5. **Violent thinking 11/12:** 07:26 (after 47, then 70), 18:25 (near 98), 20:40 (next 91), 23:12 (then 95), 01:29 (no BG, 0.5I peak just opening). No trigger named. "Might act" not said.
6. **Coffee/tea ×3–4 daily**; cin. = Kirkland cassia (≤ ~1 tsp/day).
7. **Dilution (user practice):** `0.x` = H/R diluted with 0.9% saline, stored in bottles for weeks. Advised: date bottles, fridge, new batch every 1–2 weeks, discard if cloudy, maker diluent if available; **never dilute NPH or Tresiba**; ½-unit syringe for ½I/½T.
8. **Salt craving** on fasting (pork 11/10 "needed salt"): advised salt water, bouillon (check sugar), seaweed, olives, salted butter; potassium (avocado, greens, small 低鈉鹽).

## 4. Trials

- **No-protein fasting test (from 11/09):** fu. better 11/09, none 11/10, none after small pork 11/10. 11/11 full fast. Plan: 3–5 days, log pee count + pain 0–10, then reintroduce one protein at a time.
- **Bedtime-I dawn trial:** 11/11 scored **low** (94/94 → 47). Culprit = bedtime I. 11/12 night scored **high, no logged low:** 95 → 5T<T + 0.5I>B (belly, not 内/T) → wake 145. The 0.5I peaked ~01:30–03:30 and was gone before dawn; 5T did not hold the rise. This does not re-test a slow-site 2–4I. No night I until a low-free day and a pre-bed BG ~100 with no fast tail.
- **Keto meal trial (from 11/01):** review overdue.

## 5. Health / mental

- **fu. (since 10/25):** urinalysis/culture/ultrasound advised — unknown if done.
- **Tongue biting in sleep** (decades): nocturnal-seizure sign, lows common cause → CGM, 神經內科.
- **Violent thinking / social difficulty (20+ y):** AGENTS.md §3 steps; 1925 / 119; 身心科 (CBT) offered.
- User asked for fasting + stem-cell papers (11/11): given Cheng 2014 *Cell Stem Cell* (HSC), Mihaylova 2018 *Cell Stem Cell* (gut ISC), Cheng 2017 *Cell* (FMD β-cell, mice); warned insulin-user fasting risk.

## 6. Repo

- Uncommitted: AGENTS.md, bloodsugar.md, bloodsugar_grok.md, session_state.md, images.
