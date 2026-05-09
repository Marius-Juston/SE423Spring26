# Autograder — student guide

Every push to your fork of the SE 423 repo is automatically graded. This
folder is where the latest results live; the **Actions** tab shows the
per-run logs.

## TL;DR — first time you start a homework

1. Open `workspace/assignment.txt`.
2. Add one line for the assignment you are starting, in the form
   `<ID> <folder under workspace/>`. Example for HW1 in folder `HW1mj/`:

   ```
   HW1 HW1mj
   ```

3. Commit and push as usual. Within ~1 minute:
   - The **Actions** tab on GitHub shows a green ✅ or red ❌ on your commit.
   - This `autograder/` folder gets a commit from `autograder[bot]` with the
     latest results.

That's it. No drag-and-drop, no separate website to log in to.

## Reading your results

After the bot pushes, your repo will look like:

```
autograder/
  index.md          <- overall status across every assignment
  HW1.md            <- per-check table + full grader log for HW1
  HW1.json          <- machine-readable copy
  HW2.md
  HW2.json
  history/
    HW1.jsonl       <- one line per run: {commit, timestamp, passed, failed}
```

Open `autograder/index.md` in the GitHub web UI for the at-a-glance view.
Click into a per-assignment file (`autograder/HW1.md`, …) to see *which*
checks failed and the full log.

A failed check looks like:

| Check              | Status   | Detail                                                                 |
|--------------------|----------|------------------------------------------------------------------------|
| `check_print_format` | ❌ FAIL | `[error] HW1 print format used %d for an int32_t — TI C2000 ints are 16-bit; use %ld instead.` |

The `[error]` message is the part to act on — it points at the specific
spec violation. The full log inside the `<details>` block has the
surrounding context.

## Manifest format (`workspace/assignment.txt`)

```
# <ASSIGNMENT_ID> <folder> [<main file>]
HW1 HW1mj
HW2 HW2mj
HW3 HW3
Lab5 Lab5
```

- **Cumulative**: leave previous assignments in the file. They keep being
  graded as part of your overall progress, and their result rows in
  `index.md` stay accurate even when only one folder changed in a push.
- **Change-gated**: each push only re-grades the assignments whose folder
  actually changed. Editing only HW3 won't re-build HW1 or HW2 — saves
  CI time, and their prior results in `autograder/` are preserved.
- **Force everything**: edit `workspace/assignment.txt` itself (e.g. add a
  comment) — that triggers a full re-grade. You can also go to the
  **Actions** tab → *Autograder* → **Run workflow** → check `grade-all`.
- **3rd column**: only needed if your folder contains more than one
  `*_main.c`. The autograder picks the only `*_main.c` automatically; if
  there are several it asks you to disambiguate:

  ```
  HW3 HW3 HW3_main.c
  ```

- **Comments and blanks**: lines starting with `#` and empty lines are
  ignored.

## Common errors and how to fix them

### `No *_main.c found in workspace/<folder>`

The autograder looks for a file ending in `_main.c` inside the folder you
listed. If your main file has a different name (e.g. `myhw.c`), tell the
autograder explicitly:

```
HW3 HW3 myhw.c
```

### `Multiple *_main.c in <folder>`

You have leftover `*_main.c` files (often `LABstarter_main.c` from a copy).
Either delete the extras or add the explicit 3rd column to the manifest.

### Workflow shows red ❌ but I think my code is correct

Open `autograder/<id>.md` and look at the failing check's `Detail` column.
The most common gotcha is **`%d` vs `%ld` in `serial_printf`**: the TI
C2000 has 16-bit `int`, but the grader's host has 32-bit `int`, so a
mismatch silently "works" on the host and fails on the real board. The
grader catches this — fix it once and it stays fixed.

### My push didn't trigger the autograder

Two possibilities:

1. You pushed only to files outside `workspace/` (e.g. just a README
   change). The trigger is `paths: workspace/**`. Make a workspace edit, or
   run the workflow manually from the **Actions** tab.
2. The bot's last commit was the most recent push — bot commits are tagged
   `[skip ci]` so they don't recurse. Push a new student commit and CI
   resumes.

### I don't see an `autograder/` folder yet

You haven't pushed anything that triggered a grading run yet, or the
workflow hasn't finished. Check the **Actions** tab — there should be a
recent run (in progress or queued).

### The autograder bot's commit conflicts with my next push

If you push very rapidly (within a few seconds of the bot), `git push`
locally may complain about a non-fast-forward. Just `git pull --rebase`
and push again — the bot commit is mechanical and rebases cleanly.

## What is being checked?

Each homework / lab has a list of checks derived directly from the
assignment spec — register initialization, ISR behaviour, printf format
strings, print cadence, and so on. Open the corresponding spec
(`context/homeworks/HW{N}.tex` / `context/lab/Lab{N}.txt`) to see the
exact requirements; every check in the autograder traces to a sentence
there.

The grader does **not** run your code on real hardware. It compiles your
firmware against a Linux-host shim of the C2000 peripherals, drives
simulated stimuli (button presses, ADC readings, SPI traffic, …), and
compares the resulting register state against what the spec demands. That
means a few hardware-only behaviours (real ADC noise, exact PWM timing
under load) aren't tested — but everything in the spec text is.

## Privacy and grading

- This is **automated, advisory feedback**. Final grades are recorded by
  course staff using the same checks, plus their own judgement.
- Your results live only in your own repository. Course staff have access
  by virtue of repo permissions, but no third-party service receives them.
- The `autograder/history/` folder lets you (and staff) see how your
  result evolved over time — useful for late-policy and revision credit.

## Getting help

- The full spec for an assignment is in `context/homeworks/HW{N}.tex` (or
  `context/lab/Lab{N}.txt`).
- If you believe a check is wrong, post on the course forum with: the
  failing check name, the `Detail` line, and the commit SHA in `autograder/<id>.json`.
  Course staff can reproduce against the same grader version.
