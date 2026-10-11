# Session State — Live Handoff

_Last written: 2026-10-04 19:30 CST_

> Raw data only. Re-derive conclusions; do not inherit prior AI analysis.

## 1. Today's status (2026-10-04 Sun)

- **Last known BG:** 11:16 `145mg/dL⁶` — **8h+ blind since.** No reading at any dose peak today.
- **Active insulin:** 8I @15:38 — **at peak NOW (17:38–19:38)**, tail → ~22:38. Also 3H @15:37 fading tail (~19:37). Earlier: 5I @01:49, 5H2R @11:17, 8I @11:18 — all finished.
- **Food today:** 鹽BC; Costco 鹹水雞沙拉 + ml.; 14:30 炸雞; 15:40 small-egg₅+ch., ml.+ch.
- **Doses today:** 5I + 5H2R + 8I + 3H + 8I = **31u** (two blind-ish pairs: 15:37/15:38 from an 11:16 reading).
- **HAAF flag:** severe-hypo history 6× <54 (09/30–10/02); <24h hard rule expired, but halving posture recommended for any night NPH (≤5I cap given 31u day).
- **Strip budget (10/04):** 1 used (11:16). Heavy-dose night → peak check allowed.

## 2. Recent raw trajectory

| Date | Readings | Doses |
|---|---|---|
| 10/02 | 111 → 59 → 167 → 184 | 3½, 8I, 3½R, 7I, 6H, 6H, (8+8)I |
| 10/03 | **47** → 128 → 87 → 109 | 3½H×2, (6+6)I, 3½H, 8I |
| 10/04 | 83 → 145 → ? | 5I, 5H2R, 8I, 3H, 8I |

## 3. Advice given + alarms set (19:30)

- **Next NPH: 23:00 gate** — only if bed-moment check ≥90 and not falling; tail of 8I@15:38 clears ~22:38; **halve → ≤5I** (31u day). No reading → no dose.
- Alarms set (DeskClock + voice, PIDs 731–734):
  1. **19:40** peak check 8I@15:38 (urgent — 8h blind) — `alarm_1004_1940.sh`
  2. **21:30** pre-bed −2h check — `alarm_1004_2130.sh`
  3. **23:00** bed-moment check = NPH gate — `alarm_1004_2300.sh`
  4. **01:45** overnight peak/safety check — `alarm_1005_0145.sh`
- Open: await 19:40 reading; report NPH dose at 23:00 to confirm 01:45 check relevance.

## 4. Handoff notes

1. Kill fired alarm PIDs 731–734 next session (`ps` check) — stuck-loop bug #3.
2. Two pre-bed checks (21:30, 23:00) are the decision points — do not skip.
3. If 19:40/21:30 reading <70: rescue 15g, recheck 15 min, **cancel night NPH**.
4. **Refresh this file** before switching models or ending session.
