#!/usr/bin/env bash
# Phase-660: STATUS mentions expect step notes 657-664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'expect_plan_step_notes|step_notes|Expect step notes' webui/STATUS.md
grep -qE 'phase664|through 664|e2e-phase664' webui/STATUS.md
echo "STATUS 657-664 ok"
echo "cleaned"
echo "OK: phase660 e2e passed"
