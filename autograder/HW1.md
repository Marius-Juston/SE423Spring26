# HW1 — ❌ 2/7 passed

| Check | Status | Detail |
|---|---|---|
| `check_initialization` | ❌ FAIL | [2026-05-09 17:25:41.712] [warning] GpioSetup[22] Mux Channel Selection expected to be 0 but was 5 |
| `check_timer0` | ✅ PASS | [2026-05-09 17:25:41.718] [info] Check timer 0 |
| `check_timer1` | ✅ PASS | [2026-05-09 17:25:41.718] [info] Check timer 1 |
| `check_timer2` | ❌ FAIL | [2026-05-09 17:25:41.718] [error] [check_timer2] released-buttons: GPIO27 (LED10) toggle bit not set at 100 ms boundary |
| `check_saturate` | ❌ FAIL | [2026-05-09 17:25:41.718] [error] float saturate(float, float) not available |
| `check_print_cadence` | ❌ FAIL | [2026-05-09 17:25:41.718] [error] [check_print_cadence] expected ~4 prints on SCIA (tolerance ±10% → window [3, 5]), got 0 |
| `check_print_format` | ❌ FAIL | [2026-05-09 17:25:41.718] [error] [check_print_format] no SCIA prints captured — main thread may not be servicing UARTPrint |

<details><summary>Full grader log</summary>

```
[2026-05-09 17:25:41.709] [info] Checking HW 1
[2026-05-09 17:25:41.709] [info] Check initialization
[2026-05-09 17:25:41.712] [warning] GpioSetup[22] Mux Channel Selection expected to be 0 but was 5
[2026-05-09 17:25:41.712] [warning] GpioDataRegs GPIO A Data Clear Register (GPIO0 to 31) all expected to be 239075328 but was 234881024
[2026-05-09 17:25:41.712] [warning] GpioDataRegs GPIO A Data Clear Register (GPIO0 to 31) bit 22 Output Clear bit for this pin expected to be 1 but was 0
[2026-05-09 17:25:41.713] [warning] GpioCtrlRegs GPIO A Pull Up Disable Register (GPIO0 to 31) all is non-zero
[2026-05-09 17:25:41.713] [warning] GpioCtrlRegs GPIO A Pull Up Disable Register (GPIO0 to 31) bit 22 Pull-Up Disable control for this pin is non-zero
[2026-05-09 17:25:41.713] [warning] EPwm12Regs Time Base Control Register all is non-zero
[2026-05-09 17:25:41.713] [warning] EPwm12Regs Time Base Control Register bit 15:14 Emulation Mode Bits is non-zero
[2026-05-09 17:25:41.713] [warning] EPwm12Regs Action Qualifier Control Register For Output A all is non-zero
[2026-05-09 17:25:41.713] [warning] EPwm12Regs Action Qualifier Control Register For Output A bit 1:0 Action Counter = Zero is non-zero
[2026-05-09 17:25:41.713] [warning] EPwm12Regs Action Qualifier Control Register For Output A bit 5:4 Action Counter = Compare A Up is non-zero
[2026-05-09 17:25:41.713] [warning] EPwm12Regs Time Base Period Register is non-zero
[2026-05-09 17:25:41.713] [warning] EPwm12Regs Counter Compare A Register all is non-zero
[2026-05-09 17:25:41.713] [warning] EPwm12Regs Counter Compare A Register bit 31:16 Compare A Register is non-zero
[2026-05-09 17:25:41.714] [warning] CpuTimer2 PeriodInUSec expected to be 5000 but was 40000
[2026-05-09 17:25:41.715] [warning] GpioSetup[22] Mux Channel Selection expected to be 0 but was 5
[2026-05-09 17:25:41.715] [warning] GpioDataRegs GPIO A Data Clear Register (GPIO0 to 31) all expected to be 239075328 but was 234881024
[2026-05-09 17:25:41.715] [warning] GpioDataRegs GPIO A Data Clear Register (GPIO0 to 31) bit 22 Output Clear bit for this pin expected to be 1 but was 0
[2026-05-09 17:25:41.715] [warning] GpioCtrlRegs GPIO A Pull Up Disable Register (GPIO0 to 31) all is non-zero
[2026-05-09 17:25:41.715] [warning] GpioCtrlRegs GPIO A Pull Up Disable Register (GPIO0 to 31) bit 22 Pull-Up Disable control for this pin is non-zero
[2026-05-09 17:25:41.716] [warning] EPwm12Regs Time Base Control Register all is non-zero
[2026-05-09 17:25:41.716] [warning] EPwm12Regs Time Base Control Register bit 15:14 Emulation Mode Bits is non-zero
[2026-05-09 17:25:41.716] [warning] EPwm12Regs Action Qualifier Control Register For Output A all is non-zero
[2026-05-09 17:25:41.716] [warning] EPwm12Regs Action Qualifier Control Register For Output A bit 1:0 Action Counter = Zero is non-zero
[2026-05-09 17:25:41.716] [warning] EPwm12Regs Action Qualifier Control Register For Output A bit 5:4 Action Counter = Compare A Up is non-zero
[2026-05-09 17:25:41.716] [warning] EPwm12Regs Time Base Period Register is non-zero
[2026-05-09 17:25:41.716] [warning] EPwm12Regs Counter Compare A Register all is non-zero
[2026-05-09 17:25:41.716] [warning] EPwm12Regs Counter Compare A Register bit 31:16 Compare A Register is non-zero
[2026-05-09 17:25:41.717] [warning] CpuTimer2 PeriodInUSec expected to be 5000 but was 40000
[2026-05-09 17:25:41.718] [info] Check timer 0
[2026-05-09 17:25:41.718] [info] Check timer 1
[2026-05-09 17:25:41.718] [info] Check timer 2 (spec-strict)
[2026-05-09 17:25:41.718] [error] [check_timer2] released-buttons: GPIO27 (LED10) toggle bit not set at 100 ms boundary
[2026-05-09 17:25:41.718] [error]   spec: every 100 ms boundary must toggle LED10 (GPIO27)
[2026-05-09 17:25:41.718] [error] [check_timer2] released-buttons: GPIO60 (LED11) toggle bit not set at 100 ms boundary
[2026-05-09 17:25:41.718] [error]   spec: every 100 ms boundary must toggle LED11 (GPIO60)
[2026-05-09 17:25:41.718] [error] [check_timer2] PB1-pressed: GPIO61 (LED12) toggle bit not set
[2026-05-09 17:25:41.718] [error]   spec: spec Ex.9: 'If PB1 (GPIO4) pressed (DAT==0), toggle LED12 (GPIO61)'
[2026-05-09 17:25:41.718] [error] [check_timer2] PB1-pressed: GPIO157 (LED13) toggle bit not set
[2026-05-09 17:25:41.718] [error]   spec: spec Ex.9: '...toggle LED13 (GPIO157)'
[2026-05-09 17:25:41.718] [error] [check_timer2] PB4-pressed: GPIO158 (LED14) toggle bit not set
[2026-05-09 17:25:41.718] [error]   spec: spec Ex.9: 'If PB4 (GPIO7) pressed, toggle LED14 (GPIO158)'
[2026-05-09 17:25:41.718] [error] [check_timer2] PB4-pressed: GPIO159 (LED15) toggle bit not set
[2026-05-09 17:25:41.718] [error]   spec: spec Ex.9: '...toggle LED15 (GPIO159)'
[2026-05-09 17:25:41.718] [info] Check saturate
[2026-05-09 17:25:41.718] [error] float saturate(float, float) not available
[2026-05-09 17:25:41.718] [info] Check print cadence
[2026-05-09 17:25:41.718] [error] [check_print_cadence] expected ~4 prints on SCIA (tolerance ±10% → window [3, 5]), got 0
[2026-05-09 17:25:41.718] [error]   hint: zero printf calls were captured. Common causes:
[2026-05-09 17:25:41.718] [error]         - the SCI driver wasn't initialised (init_serialSCIA / serial_printf gated)
[2026-05-09 17:25:41.718] [error]         - UARTPrint == 1 is never set inside cpu_timer2_isr
[2026-05-09 17:25:41.718] [error]         - the print is gated by 'if (CpuTimer2.InterruptCount % N == 0)' but InterruptCount never reaches a multiple of N during the test window
[2026-05-09 17:25:41.718] [error]   spec Ex.5: serial_printf must fire every 250 ms — that's 4 prints in 1 s
[2026-05-09 17:25:41.718] [info] Check print format
[2026-05-09 17:25:41.718] [error] [check_print_format] no SCIA prints captured — main thread may not be servicing UARTPrint
[2026-05-09 17:25:41.718] [info] Homework: 1
[2026-05-09 17:25:41.718] [warning] Did not succeed all checks
```

</details>
