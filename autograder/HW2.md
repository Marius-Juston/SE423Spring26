# HW2 — ❌ 0/4 passed

| Check | Status | Detail |
|---|---|---|
| `check_initialization` | ❌ FAIL | [2026-05-09 05:23:43.369] [error] [HW2/init] EPwm4Regs.TBPRD not ~50000 (expected 50 MHz / 1 kHz) |
| `check_adc_isr_scaling` | ❌ FAIL | [2026-05-09 05:23:43.372] [error] [HW2/adc_scaling] missing student symbols (ADCA_ISR, Adca4result, JoystickX/Yresult, Adca4voltage, JoystickX/Yvoltage) |
| `check_print_cadence` | ❌ FAIL | [2026-05-09 05:23:43.372] [error] [HW2/print_cadence] ADCA_ISR not defined by student |
| `check_print_format` | ❌ FAIL | [2026-05-09 05:23:43.372] [error] [HW2/print_format] ADCA_ISR not defined by student |

<details><summary>Full grader log</summary>

```
[2026-05-09 05:23:43.357] [info] Checking HW 2
[2026-05-09 05:23:43.357] [info] [HW2] check_initialization
[2026-05-09 05:23:43.369] [error] [HW2/init] EPwm4Regs.TBPRD not ~50000 (expected 50 MHz / 1 kHz)
[2026-05-09 05:23:43.369] [error]   spec: TBPRD = 50000 yields 50 MHz / 50000 = 1 kHz
[2026-05-09 05:23:43.369] [error] [HW2/init] EPwm4Regs.ETSEL.SOCAEN != 1 (must enable SOCA trigger)
[2026-05-09 05:23:43.369] [error] [HW2/init] EPwm4Regs.ETSEL.SOCASEL != 2 (must trigger on counter == TBPRD)
[2026-05-09 05:23:43.369] [error] [HW2/init] EPwm4Regs.ETPS.SOCAPRD != 1 (trigger every 1st event)
[2026-05-09 05:23:43.369] [error] [HW2/init] AdcaRegs.ADCSOC0CTL.CHSEL != 4 (ADCINA4 = photodiode)
[2026-05-09 05:23:43.369] [error] [HW2/init] AdcaRegs.ADCSOC1CTL.CHSEL != 2 (ADCINA2 = joystick X)
[2026-05-09 05:23:43.369] [error] [HW2/init] AdcaRegs.ADCSOC2CTL.CHSEL != 3 (ADCINA3 = joystick Y)
[2026-05-09 05:23:43.369] [error] [HW2/init] AdcaRegs.ADCSOC0CTL.TRIGSEL != 0x0B (EPWM4 ADCSOCA)
[2026-05-09 05:23:43.369] [error] [HW2/init] ADCINTSEL1N2.INT1SEL != 2 (interrupt on last SOC)
[2026-05-09 05:23:43.369] [error] [HW2/init] ADCINTSEL1N2.INT1E != 1 (must enable ADCA1 interrupt)
[2026-05-09 05:23:43.369] [error] [HW2/init] AdcaRegs.ADCCTL1.ADCPWDNZ != 1 (ADCA must be powered up)
[2026-05-09 05:23:43.369] [warning] PieCtrlRegs Interrupt Group 1 Enable Register all expected to be 65 but was 64
[2026-05-09 05:23:43.369] [warning] PieCtrlRegs Interrupt Group 1 Enable Register bit 0 Enable for Interrupt 1.1 expected to be 1 but was 0
[2026-05-09 05:23:43.371] [warning] CpuTimer2 PeriodInUSec expected to be 1000 but was 40000
[2026-05-09 05:23:43.372] [info] [HW2] check_adc_isr_scaling
[2026-05-09 05:23:43.372] [error] [HW2/adc_scaling] missing student symbols (ADCA_ISR, Adca4result, JoystickX/Yresult, Adca4voltage, JoystickX/Yvoltage)
[2026-05-09 05:23:43.372] [info] [HW2] check_print_cadence
[2026-05-09 05:23:43.372] [error] [HW2/print_cadence] ADCA_ISR not defined by student
[2026-05-09 05:23:43.372] [info] [HW2] check_print_format
[2026-05-09 05:23:43.372] [error] [HW2/print_format] ADCA_ISR not defined by student
[2026-05-09 05:23:43.372] [info] Homework: 2
[2026-05-09 05:23:43.372] [warning] Did not succeed all checks
```

</details>
