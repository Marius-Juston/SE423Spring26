# HW1 — ❌ 2/7 passed

| Check | Status | Detail |
|---|---|---|
| `check_initialization` | ✅ PASS | [2026-05-09 06:00:20.738] [info] Check initialization |
| `check_timer0` | ❌ FAIL | [2026-05-09 06:00:20.756] [warning] Timer0 GPIO34 toggle GPIO B Data Toggle Register (GPIO32 to 63) all expected to be 4 but was 0 |
| `check_timer1` | ✅ PASS | [2026-05-09 06:00:20.756] [info] Check timer 1 |
| `check_timer2` | ❌ FAIL | [2026-05-09 06:00:20.756] [error] [check_timer2] PB1-pressed: GPIO61 (LED12) toggle bit not set |
| `check_saturate` | ❌ FAIL | [2026-05-09 06:00:20.756] [error] Expecting saturate(0, 0.25) = 0 got -0.25 |
| `check_print_cadence` | ❌ FAIL | [2026-05-09 06:00:20.887] [error] [check_print_cadence] expected ~4 prints on SCIA (tolerance ±25% → window [3, 5]), got 0 |
| `check_print_format` | ❌ FAIL | [2026-05-09 06:00:20.937] [error] [check_print_format] no SCIA prints captured — main thread may not be servicing UARTPrint |

<details><summary>Full grader log</summary>

```
[2026-05-09 06:00:20.738] [info] Checking HW 1
[2026-05-09 06:00:20.738] [info] Check initialization
[2026-05-09 06:00:20.756] [info] Check timer 0
[2026-05-09 06:00:20.756] [warning] Timer0 GPIO34 toggle GPIO B Data Toggle Register (GPIO32 to 63) all expected to be 4 but was 0
[2026-05-09 06:00:20.756] [warning] Timer0 GPIO34 toggle GPIO B Data Toggle Register (GPIO32 to 63) bit 2 Output Toggle bit for this pin expected to be 1 but was 0
[2026-05-09 06:00:20.756] [info] Check timer 1
[2026-05-09 06:00:20.756] [info] Check timer 2 (spec-strict)
[2026-05-09 06:00:20.756] [error] [check_timer2] PB1-pressed: GPIO61 (LED12) toggle bit not set
[2026-05-09 06:00:20.756] [error]   spec: spec Ex.9: 'If PB1 (GPIO4) pressed (DAT==0), toggle LED12 (GPIO61)'
[2026-05-09 06:00:20.756] [error] [check_timer2] PB1-pressed: GPIO157 (LED13) toggle bit not set
[2026-05-09 06:00:20.756] [error]   spec: spec Ex.9: '...toggle LED13 (GPIO157)'
[2026-05-09 06:00:20.756] [error] [check_timer2] PB4-pressed: GPIO158 (LED14) toggle bit not set
[2026-05-09 06:00:20.756] [error]   spec: spec Ex.9: 'If PB4 (GPIO7) pressed, toggle LED14 (GPIO158)'
[2026-05-09 06:00:20.756] [error] [check_timer2] PB4-pressed: GPIO159 (LED15) toggle bit not set
[2026-05-09 06:00:20.756] [error]   spec: spec Ex.9: '...toggle LED15 (GPIO159)'
[2026-05-09 06:00:20.756] [info] Check saturate
[2026-05-09 06:00:20.756] [error] Expecting saturate(0, 0.25) = 0 got -0.25
[2026-05-09 06:00:20.756] [error] Expecting saturate(-0.5, 1) = -0.5 got -1
[2026-05-09 06:00:20.756] [error] Expecting saturate(0, 1) = 0 got -1
[2026-05-09 06:00:20.756] [error] Expecting saturate(0.5, 1) = 0.5 got -1
[2026-05-09 06:00:20.756] [error] Expecting saturate(-1, 1.5) = -1 got -1.5
[2026-05-09 06:00:20.756] [error] Expecting saturate(-0.5, 1.5) = -0.5 got -1.5
[2026-05-09 06:00:20.756] [error] Expecting saturate(0, 1.5) = 0 got -1.5
[2026-05-09 06:00:20.756] [error] Expecting saturate(0.5, 1.5) = 0.5 got -1.5
[2026-05-09 06:00:20.756] [error] Expecting saturate(-1, 1.5) = -1 got -1.5
[2026-05-09 06:00:20.756] [error] Expecting saturate(-1, 2) = -1 got -2
[2026-05-09 06:00:20.756] [error] Expecting saturate(-0.5, 2) = -0.5 got -2
[2026-05-09 06:00:20.756] [error] Expecting saturate(0, 2) = 0 got -2
[2026-05-09 06:00:20.756] [error] Expecting saturate(0.5, 2) = 0.5 got -2
[2026-05-09 06:00:20.756] [error] Expecting saturate(-1, 2) = -1 got -2
[2026-05-09 06:00:20.756] [error] Expecting saturate(-10, 15) = -10 got -15
[2026-05-09 06:00:20.756] [error] Expecting saturate(-2, 15) = -2 got -15
[2026-05-09 06:00:20.756] [error] Expecting saturate(-1, 15) = -1 got -15
[2026-05-09 06:00:20.756] [error] Expecting saturate(-0.5, 15) = -0.5 got -15
[2026-05-09 06:00:20.756] [error] Expecting saturate(0, 15) = 0 got -15
[2026-05-09 06:00:20.756] [error] Expecting saturate(0.5, 15) = 0.5 got -15
[2026-05-09 06:00:20.756] [error] Expecting saturate(-1, 15) = -1 got -15
[2026-05-09 06:00:20.756] [error] Expecting saturate(-2, 15) = -2 got -15
[2026-05-09 06:00:20.756] [error] Expecting saturate(-10, 15) = -10 got -15
[2026-05-09 06:00:20.756] [info] Check print cadence
[2026-05-09 06:00:20.887] [error] [check_print_cadence] expected ~4 prints on SCIA (tolerance ±25% → window [3, 5]), got 0
[2026-05-09 06:00:20.887] [error]   hint: zero printf calls were captured. Common causes:
[2026-05-09 06:00:20.887] [error]         - the SCI driver wasn't initialised (init_serialSCIA / serial_printf gated)
[2026-05-09 06:00:20.887] [error]         - UARTPrint == 1 is never set inside cpu_timer2_isr
[2026-05-09 06:00:20.887] [error]         - the print is gated by 'if (CpuTimer2.InterruptCount % N == 0)' but InterruptCount never reaches a multiple of N during the test window
[2026-05-09 06:00:20.887] [error]   spec Ex.5: serial_printf must fire every 250 ms — that's 4 prints in 1 s
[2026-05-09 06:00:20.887] [info] Check print format
[2026-05-09 06:00:20.937] [error] [check_print_format] no SCIA prints captured — main thread may not be servicing UARTPrint
[2026-05-09 06:00:20.937] [info] Homework: 1
[2026-05-09 06:00:20.937] [warning] Did not succeed all checks
```

</details>
