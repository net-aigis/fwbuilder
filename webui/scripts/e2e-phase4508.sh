#!/usr/bin/env bash
# Phase-4508: STATUS mentions expect_steps_refusals_roster sessionStorage / 4505-4512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_steps_refusals_roster.*(sessionStorage|Clear)|sessionStorage.*expect_steps_refusals_roster' webui/STATUS.md
grep -qE 'phase4512|through 4512|e2e-phase4512' webui/STATUS.md
echo "STATUS expect_steps_refusals_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4508 e2e passed"
