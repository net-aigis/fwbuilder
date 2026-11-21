#!/usr/bin/env bash
# Phase-2860: STATUS mentions expect step roster / 2857-2864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_step_roster|expect step roster' webui/STATUS.md
grep -qE 'phase2864|through 2864|e2e-phase2864' webui/STATUS.md
echo "STATUS expect step roster ok"
echo "cleaned"
echo "OK: phase2860 e2e passed"
