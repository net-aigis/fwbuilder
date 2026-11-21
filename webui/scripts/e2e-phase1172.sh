#!/usr/bin/env bash
# Phase-1172: STATUS mentions expect_plan_step_titles / 1169-1176.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'expect_plan_step_titles|expect step titles' webui/STATUS.md
grep -qE 'phase1176|through 1176|e2e-phase1176' webui/STATUS.md
echo "STATUS expect_plan_step_titles ok"
echo "cleaned"
echo "OK: phase1172 e2e passed"
