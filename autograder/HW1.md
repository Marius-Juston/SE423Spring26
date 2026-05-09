# HW1 — ❌ 3/7 passed

| Check | Status | Detail |
|---|---|---|
| `check_initialization` | ✅ PASS | [2026-05-09 07:56:53.995] [info] Check initialization |
| `check_timer0` | ❌ FAIL | [2026-05-09 07:56:54.003] [warning] Timer0 GPIO34 toggle GPIO B Data Toggle Register (GPIO32 to 63) all expected to be 4 but was 0 |
| `check_timer1` | ✅ PASS | [2026-05-09 07:56:54.003] [info] Check timer 1 |
| `check_timer2` | ❌ FAIL | [2026-05-09 07:56:54.003] [error] [check_timer2] PB1-pressed: GPIO61 (LED12) toggle bit not set |
| `check_saturate` | ❌ FAIL | [2026-05-09 07:56:54.003] [error] Expecting saturate(0, 0.25) = 0 got -0.25 |
| `check_print_cadence` | ✅ PASS | [2026-05-09 07:56:54.003] [info] Check print cadence |
| `check_print_format` | ❌ FAIL | [2026-05-09 07:56:54.004] [error] [check_print_format[Ex.8]] expected 4 format specifier(s), got 5 |

<details><summary>Full grader log</summary>

```
[2026-05-09 07:56:53.995] [info] Checking HW 1
[2026-05-09 07:56:53.995] [info] Check initialization
[2026-05-09 07:56:54.003] [info] Check timer 0
[2026-05-09 07:56:54.003] [warning] Timer0 GPIO34 toggle GPIO B Data Toggle Register (GPIO32 to 63) all expected to be 4 but was 0
[2026-05-09 07:56:54.003] [warning] Timer0 GPIO34 toggle GPIO B Data Toggle Register (GPIO32 to 63) bit 2 Output Toggle bit for this pin expected to be 1 but was 0
[2026-05-09 07:56:54.003] [info] Check timer 1
[2026-05-09 07:56:54.003] [info] Check timer 2 (spec-strict)
[2026-05-09 07:56:54.003] [error] [check_timer2] PB1-pressed: GPIO61 (LED12) toggle bit not set
[2026-05-09 07:56:54.003] [error]   spec: spec Ex.9: 'If PB1 (GPIO4) pressed (DAT==0), toggle LED12 (GPIO61)'
[2026-05-09 07:56:54.003] [error] [check_timer2] PB1-pressed: GPIO157 (LED13) toggle bit not set
[2026-05-09 07:56:54.003] [error]   spec: spec Ex.9: '...toggle LED13 (GPIO157)'
[2026-05-09 07:56:54.003] [error] [check_timer2] PB4-pressed: GPIO158 (LED14) toggle bit not set
[2026-05-09 07:56:54.003] [error]   spec: spec Ex.9: 'If PB4 (GPIO7) pressed, toggle LED14 (GPIO158)'
[2026-05-09 07:56:54.003] [error] [check_timer2] PB4-pressed: GPIO159 (LED15) toggle bit not set
[2026-05-09 07:56:54.003] [error]   spec: spec Ex.9: '...toggle LED15 (GPIO159)'
[2026-05-09 07:56:54.003] [info] Check saturate
[2026-05-09 07:56:54.003] [error] Expecting saturate(0, 0.25) = 0 got -0.25
[2026-05-09 07:56:54.003] [error] Expecting saturate(-0.5, 1) = -0.5 got -1
[2026-05-09 07:56:54.003] [error] Expecting saturate(0, 1) = 0 got -1
[2026-05-09 07:56:54.003] [error] Expecting saturate(0.5, 1) = 0.5 got -1
[2026-05-09 07:56:54.003] [error] Expecting saturate(-1, 1.5) = -1 got -1.5
[2026-05-09 07:56:54.003] [error] Expecting saturate(-0.5, 1.5) = -0.5 got -1.5
[2026-05-09 07:56:54.003] [error] Expecting saturate(0, 1.5) = 0 got -1.5
[2026-05-09 07:56:54.003] [error] Expecting saturate(0.5, 1.5) = 0.5 got -1.5
[2026-05-09 07:56:54.003] [error] Expecting saturate(-1, 1.5) = -1 got -1.5
[2026-05-09 07:56:54.003] [error] Expecting saturate(-1, 2) = -1 got -2
[2026-05-09 07:56:54.003] [error] Expecting saturate(-0.5, 2) = -0.5 got -2
[2026-05-09 07:56:54.003] [error] Expecting saturate(0, 2) = 0 got -2
[2026-05-09 07:56:54.003] [error] Expecting saturate(0.5, 2) = 0.5 got -2
[2026-05-09 07:56:54.003] [error] Expecting saturate(-1, 2) = -1 got -2
[2026-05-09 07:56:54.003] [error] Expecting saturate(-10, 15) = -10 got -15
[2026-05-09 07:56:54.003] [error] Expecting saturate(-2, 15) = -2 got -15
[2026-05-09 07:56:54.003] [error] Expecting saturate(-1, 15) = -1 got -15
[2026-05-09 07:56:54.003] [error] Expecting saturate(-0.5, 15) = -0.5 got -15
[2026-05-09 07:56:54.003] [error] Expecting saturate(0, 15) = 0 got -15
[2026-05-09 07:56:54.003] [error] Expecting saturate(0.5, 15) = 0.5 got -15
[2026-05-09 07:56:54.003] [error] Expecting saturate(-1, 15) = -1 got -15
[2026-05-09 07:56:54.003] [error] Expecting saturate(-2, 15) = -2 got -15
[2026-05-09 07:56:54.003] [error] Expecting saturate(-10, 15) = -10 got -15
[2026-05-09 07:56:54.003] [info] Check print cadence
[2026-05-09 07:56:54.003] [info] serial[SCIA]: Timeint = 1 (wrong: 1), Time = 0.25sec, Input = 0.485, SatOut = -2.65
[2026-05-09 07:56:54.003] [info] serial[SCIA]: Timeint = 2 (wrong: 2), Time = 0.50sec, Input = 0.719, SatOut = -2.65
[2026-05-09 07:56:54.003] [info] serial[SCIA]: Timeint = 3 (wrong: 3), Time = 0.75sec, Input = 0.950, SatOut = -2.65
[2026-05-09 07:56:54.003] [info] serial[SCIA]: Timeint = 4 (wrong: 4), Time = 1.00sec, Input = 1.177, SatOut = -2.65
[2026-05-09 07:56:54.003] [info] Check print format
[2026-05-09 07:56:54.003] [info] serial[SCIA]: Timeint = 5 (wrong: 5), Time = 1.25sec, Input = 1.398, SatOut = -2.65
[2026-05-09 07:56:54.003] [info] serial[SCIA]: Timeint = 6 (wrong: 6), Time = 1.50sec, Input = 1.612, SatOut = -2.65
[2026-05-09 07:56:54.004] [error] [check_print_format[Ex.8]] expected 4 format specifier(s), got 5
[2026-05-09 07:56:54.004] [error]   expected fmt: "Timeint = %ld, Time = %.2f sec, Input = %.3f, SatOut = %.2f
"
[2026-05-09 07:56:54.004] [error]   actual   fmt: "Timeint = %ld (wrong: %d), Time = %.2fsec, Input = %.3f, SatOut = %.2f
"
[2026-05-09 07:56:54.004] [error]   rendered:    "Timeint = 6 (wrong: 6), Time = 1.50sec, Input = 1.612, SatOut = -2.65
"
[2026-05-09 07:56:54.004] [error]   hint: you are printing 1 extra argument(s).
[2026-05-09 07:56:54.004] [error] [check_print_format[Ex.5-fallback]] expected 2 format specifier(s), got 5
[2026-05-09 07:56:54.004] [error]   expected fmt: "Num Timer2:%ld Num SerialRX: %ld
"
[2026-05-09 07:56:54.004] [error]   actual   fmt: "Timeint = %ld (wrong: %d), Time = %.2fsec, Input = %.3f, SatOut = %.2f
"
[2026-05-09 07:56:54.004] [error]   rendered:    "Timeint = 6 (wrong: 6), Time = 1.50sec, Input = 1.612, SatOut = -2.65
"
[2026-05-09 07:56:54.004] [error]   hint: you are printing 3 extra argument(s).
[2026-05-09 07:56:54.004] [info] Homework: 1
[2026-05-09 07:56:54.004] [warning] Did not succeed all checks
```

</details>
