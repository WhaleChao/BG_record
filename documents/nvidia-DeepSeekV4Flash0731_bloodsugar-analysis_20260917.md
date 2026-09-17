# Blood-Sugar Analysis — nvidia/DeepSeek-V4-Flash 0731

*Source: `bloodsugar.md` (2026-02-14 → 2026-09-17, 216 logged days, ~1,094 readings)
· framework: Dr. Bernstein · companion files: protocol_summary_20260324, fasting_NPH_liver_20260917*
*Generated: 2026-09-17*

---

## 0. Executive summary

The log shows a T1D on a ketogenic/low-carb protocol with **excellent HbA1c (4.6–5.3%) but chronically unstable day-to-day glucose, dominated by severe hypoglycemia**. The single most important signal is not hyperglycemia — it is **repeated severe lows (<54)**. Using only genuine readings (`NNmg/dL`), roughly **half of all recorded readings are below 54 mg/dL** and two-thirds below 70. This is the root cause of the mental fog, unrefreshed sleep, and violent-thought episodes you log, and it directly feeds the HAAF warning signs your own protocol documents.

The dominant mechanism is an **imbalance between NPH (I) / short-acting boluses and an essentially food-buffered ketogenic day** — insulin frequently outruns hepatic glucose output, especially when the liver is glycogen-depleted.

---

## 1. The hypoglycemia crisis (primary finding)

| Metric (genuine readings only) | Count | Share of readings |
|---|---|---|
| Total readings | 1,094 | 100% |
| < 70 mg/dL | ~738 | ~67% |
| < 54 mg/dL (severe) | ~570 | ~52% |
| Values ≤ 40 | frequent (36, 38, 40, 44…) | recurring |
| Lowest logged | 24–25 (Aug 4, Aug 3, Jul 28) | — |

These are not isolated events — they recur **nearly every day** across Feb–Sep 2026. Even accounting for the fact that hypos prompt more fingersticks, the absolute frequency is well beyond any "occasional overtreatment" profile.

### Recurring severe lows (representative)
- `02-16 17:59 34` · `02-17 12:35 40` · `07-28 11:08 28` · `08-03 06:24 25 / 09:05 LO` · `08-04 08:18 24` · `08-13 07:37 29` · `09-09 22:40 30` · `09-14 06:12 36`

### Why this is so dangerous for you specifically
1. **HAAF** (your own protocol §HAAF): every <54 blunts counterregulation for 24–48h. You log "feeling fine at 32–37" and "feel fine at 61/71" — the classic HAAF warning. Recovery requires **zero severe hypos for 2–3 weeks**, and I do not see a sustained stretch of that in this log.
2. **Mental substrate**: your mental-score principle says stable overnight 80–95 is the single most impactful lever. The log shows frequent overnight/morning lows (25, 28, 29, 30, 34, 36, 38, 40…), which predict the 2.5–4 mental scores and violent/agitation episodes you annotate.
3. **Rebound trap**: each severe low is followed by rebound hyper (e.g. 38→121, 46→rebound, 40→high), which invites a bigger correction → next low. The log shows this see-saw repeatedly.

---

## 2. NPH (I) behavior — the central lever

The data repeatedly confirms your compressed-NPH discovery: **your I lasts ~4–7h, not textbook 12–18h**, and behaves like ~1.5× potent Regular.

**Evidence across the log:**
- Morning `9I` from 06:22 is "done" by ~13:30 (07-24h) — same finding in both the 09-17 lesson and earlier days.
- Night-time NPH stacks with short-acting tails and repeatedly lands lows in the 24:00–06:00 window (e.g. `08-03 25`, `08-04 24`, `09-09 30`, `09-14 36`).

**Key rule reinforced (from fasting_NPH_liver_20260917):** NPH both drives uptake *and* suppresses the gluconeogenesis that makes the rise — so a fasting NPH dose produces a **net crash**, not subtraction. Today's 87 + `4I` → 44 (−43) is the canonical case.

### Practical consequence
- When NPH duration is compressed to 4–7h, splitting it and treating the **tail** (onset 1–2h, peak 2–4h, tail to 6–7h) matters more than the label. Stacking a new I shot before the prior tail is gone → overlapping peaks → predictable night lows.
- **Your own gap rule is the guardrail**: rising <90 fasting = eat first, never full NPH; 90–110 rising = half-dose (2–4I); full dose only ≥110 **with food**.

---

## 3. The food–basal buffer problem

The log's biggest structural risk: **a very low-carb/ketogenic eating pattern with fat-only evening gaps, combined with basal (I/T) that does not stop working overnight.**

- Eating days still inject `(7+7)I`, `(8+8)I`, `(9+9)I`, `(10+10)T` etc. late night/early morning.
- When the meal buffer is small (fasting day, or fat-only after 19:00) and the liver is glycogen-empty, even modest basal outruns glucose output → the 24–44 lows cluster precisely in this window.

**Pattern noted:** lows frequently appear 3–6h after a big night-time insulin shot that was sized for a larger meal than was eaten (e.g. `08-03 睡前小hyper只靠(9+9)T降至25`). The dosage was aimed at the projected high, but the food didn't arrive.

---

## 4. Food triggers — sugar/hidden-starch are the volatility drivers

Categorical finding: **sugar and hidden-starch items are the highest-volatility input** and tend to precede either hyper rebound or the "binge → big correction → low" cascade.

- **甜酒 (sweet rice wine)** — 32 occurrences, repeatedly implicated in hyper and then hypos: `08-20 "甜酒喝太多"→166`, multiple `[甜酒+ml]` rescue + `[甜酒(少)]`. It is *liquid glucose* — even "少" (little) perturbs the system.
- **澱粉 (starch)** — 31 occurrences. `08-28` is the clearest cascade: 意麵(starch)→186/208/248 → 8+7+9H corrections → 61 low → 215 rebound → binge-end 01:16. This is the classic "starch binge + over-correction" loop.
- **有糖牛肉罐頭 / 有糖牛肉 (sugared canned beef)** — `08-22`, `08-24`, `08-26` (242 after), all flagged by your own annotations as driving highs.
- **豬肉 (pork)** — your own note `08-11 "豬肉會造成血糖持續升高"` and `08-20 "有吃豬肉，即使加大量油脂血糖仍會大幅上升"`. Persistent post-pork rise + `(9+9)T` suppression → next-day lows.

**Suggestion:** treat 甜酒 as off-limits except as an intentional glucose-rescue tool (and then measure it as grams, not "a little"). Audit sugared canned meats entirely. Starch days need a different (higher, pre-meal, split) strategy rather than correction after the spike.

---

## 5. The overnight / morning window (biggest mental-health lever)

Consistent with your protocol: **stable overnight 80–95 is worth more than any medication for next-day clarity.** The log's mental annotations track the overnight BG:

| Overnight/morning low | Logged mental state |
|---|---|
| 24–25 (Aug 3–4) | (severe) |
| 29/30 (Aug 13 / Sep 9) | — |
| 36 (Sep 14) | + 暴力幻想 (violent imagery) |
| 40 / 31 (Jul) | miserable / feel terrible |
| 52→40 night (Sep 16) | feel hyper after 9I |

The chain is: **late-night insulin sized for food → food buffer too small → 02:00–06:00 low → rebound cortisol + unrefreshed sleep → next-day 2.5–4 mental.** Your principle (§Pre-Bed, §Evening) already prescribes the fix; the log says it is not yet being held reliably every night.

---

## 6. What is working (protect these)

1. **HbA1c 4.6–5.3%** with no serious hypo/syncope since keto — the framework is right.
2. **Keto + IF** shows genuinely good days: `08-25` "feel ok without R/H injection", `09-17` "woke unrefreshed but overall good" with fasting 71→87 gentle gap.
3. **The double pre-bed check** (1–2h before + at bed) is being used and is exactly right — it's how you caught the 9/17 trajectory.
4. **Reflexive hypo rescue** with glucose powder/milk is fast and appropriate.

---

## 7. Recommendations (ranked by impact)

1. **Make "zero severe lows (<54) for 2–3 weeks" the top objective.** Nothing else moves the mental/sleep substrate faster. On a low-carb day, prefer **under-treating** a projection to over-treating: you can always add, you cannot un-inject.
2. **Move night-time NPH sizing to the actual meal, not the projected high.** If the evening is fat-only (no buffer), reduce or split the I and rely on pre-bed R for brain pulsatility (your §Pre-Bed R principle) rather than a large I that won't stop.
3. **Enforce the gap rule literally** (from fasting_NPH_liver_20260917): rising <90 fasting = eat first, 0I; 90–110 = 2–4I half-dose; ≥110+food = full. The 9/17 `4I` crash is the reminder.
4. **Cut 甜酒 and sugared canned meats.** Treat them as measured glucose tools, not condiments. Hidden starch (`澱粉`) should carry a mandatory pre-meal bolus *before* eating, not a correction after.
5. **Set a hard "no food buffer" rule for night basal:** if the last real meal was >6h ago and glycogen is low, halve the night-time I/T dose — the log's worst lows cluster exactly there.
6. **Keep the double pre-bed check, and add a 02:00–04:00 alarm check on any night you stacked I after 23:00.** The worst overnight lows are all in that window.

---

## 8. One-line takeaway

> Your A1c proves the diet; your volatile SD proves the insulin timing. The path to stable mornings and clear mentation is **one sustained fortnight of no severe lows** — dose NPH for the food that is actually coming, and let a slightly-high evening outrank a low night.

*Prepared for review against Dr. Bernstein framework and your personal protocol. Log annotations are the richest asset here — keep logging.*