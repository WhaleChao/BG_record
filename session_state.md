# Session State — Live Handoff

_Last written: 2026-10-14 ~01:05 CST_

> Raw data only. Re-derive conclusions; do not inherit prior AI analysis.
> ⚠️ **Device system clock is ~8h behind local time (shows UTC).** Use the user's logged times; add 8h when computing alarm sleeps from `date`.

## 1. Today's status (2026-10-13 Tue → night into 10-14 Wed)

- **Readings 10/13:** 07:10 48 → 12:24 58 [3.8g+cf.][ch₂] → 18:20 **45** ("feeling ok" = HAAF unawareness; ate leftover 牛 + ch₄, no glucose) → 00:52 135 → **02:53 84** (woke; −51 in 2h, 5I peak still ahead; advised 6–9g + ch., recheck ~04:00) → **10/14 06:40 58** (wake, HAAF continues).
- **Active insulin (BEDTIME, against advice):** **1½H @00:56** (peak ~01:30–02:30, est. −80–100 → ~40–60) + **5I @00:57** (peak ~03:00–05:00, predictor 03:57, tail → ~07:00). Advised 1R only, no I.
- **Advised:** eat ch.+ml. now; **test 02:30** (<80 → 9–12g, recheck 04:00; 80–110 → 3–6g+ch., recheck 04:00; >110 sleep); glucose at bedside. Alarm offered, NOT set.
- **HAAF flag:** active. Lows 31 (10/11), 36 (10/12 05:58), 48 (10/13 07:10), 58 (12:24), 45 (18:20). Post-hypo reduction (AGENTS.md §3 table): repeated <54 → ×0.5 (0–12h) / ×0.6 (12–24h) after the latest low, culprit slot (evening/bedtime I) −1–2u per low; morning shot exempt. Latest low 10/14 06:40 58.
- **Strips:** 10/13 = 4 (07:10, 12:24, 18:20, 00:52).
- **Mental:** says ok all day.

## 2. Recent raw trajectory

| Date | Readings | Doses |
|---|---|---|
| 10/07 | 52 → 47 → 39 | 8I, 3½R, 8I |
| 10/08 | 61 → 189 → 131 → 163 | 3H, 9I, 6R, 8I, 4H, 8I, 5T |
| 10/09 | 33 → 129 → 106 → 45 → 82 | 8I, 7I, 3½R, 3½R, 10T |
| 10/10 | 196 → 81 → 164 | 9H, 5½R, 8I, 3½R, 9⁺I |
| 10/11 | 58 → **32** → 59 → **31** | 8I, 4R, 8I |
| 10/12 | 36 → 111 → 77 → 106 | 7I, 3⁻H, 4R, 8I @16:53, **9I @22:00** (≈30.75u) |
| 10/13 | 48 → 58 → 45 → 135 | 8½I @07:22, 1½H + 5I @00:56–57 |

Pattern: evening/bedtime I (8–9I) followed by night/wake lows on 10/07, 10/09, 10/11, 10/12, 10/13.

## 3. Advice given (for the next model to re-check, not inherit)

- Tonight: evening I ≤4I and before ~19:00; **no I at bedtime** (NPH rule: never overnight, never <90, never stacked on a tail).
- Pre-bed: bed-moment 90–130 → no insulin; >130 rising → ≤1–1½R (post-hypo reduced); <90 → cheese / glucose.
- If any bedtime I is taken anyway: glucose at bedside, peak check from `predict_next_check.sh`.
- Suggested once: discuss this week's repeated <54 pattern with the diabetes doctor.

## 4. Changes made this session (10/11–10/13)

- **AGENTS.md:** removed `instructions.md` from read order; added rule "morning insulin shot is critical for the whole day — never skip it"; morning shot exempt from post-hypo halving (also README.md, `documents/morning_dawn_H_rule.md`); added "violent thinking on rising BG 100–150 → bring to 70–100" (user observation, unverified, with log tally).
- **New files:** `insulin_daily_dosage.md` (Feb–Sep daily units, append monthly), `totals_stripe_combined.md` (Feb–Sep daily strip counts, append monthly), `202604`–`202609_insulin_totals.md` (tables only; duplicates of the combined file — user may delete).
- **10/13:** added "morning coffee rise" rule to AGENTS.md §3, README.md (morning rules), `documents/morning_dawn_H_rule.md` §4. Logged 12:24 58[3.8g+cf.].
- **10/14:** "halve if post-hypo" replaced by severity-graded reduction table (AGENTS.md §3; also `documents/fasting_NPH_liver_20260917.md`, `documents/3_eating_patterns.md`).
- Nothing committed (git needs `-c safe.directory='*'` — repo ownership mismatch).

## 5. Handoff notes

1. **First ask: the 02:30 / ~04:00 night readings and the wake BG.** Real crash risk from 1½H + 5I at 135 (precedent: 10/12 9I @106 → 36 at 05:58).
2. Morning shot on waking by the dawn bands (not halved), but low end if the I tail (→ ~07:00) is still active.
3. 6 straight days of lows after 8–9I. Tonight's evening I ≤4I before ~19:00; no I at bedtime (repeated). Suggest a doctor visit about the <54 pattern.
4. New rule added 10/13: "morning coffee rise" (AGENTS.md §3, README.md, `documents/morning_dawn_H_rule.md` §4), unverified, confirm with 1h post-鹽BC BG.
5. Analyses done 10/13 (chat only, not saved): (a) untreated 40–70 scan: 22 cases, never zero insulin; flat/falling only while basal/I tail active (3 went to 35–44), fast rises when meal + fast insulin wore off. (b) Fasting 04/09–04/14: 42T on D1 drove D2–4 lows; 20–64g glucose/day; D6–7 rise "can't be lowered" at ~2–6u/day insulin; user says the vomiting was coffee residue on an empty stomach, so DKA is possible but unproven (no ketone meter).
6. User's editor can overwrite agent edits in `bloodsugar.md` (the 00:52 line vanished once). Re-read the tail before every edit.
7. October rows for `insulin_daily_dosage.md` / `totals_stripe_combined.md` at month end. Nothing committed (git needs `-c safe.directory='*'`).
8. **Refresh this file** before switching models or ending the session.
