#!/usr/bin/env bash
# Phase-4428: STATUS mentions expect_steps_roster sessionStorage / 4425-4432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_steps_roster.*(sessionStorage|Clear)|sessionStorage.*expect_steps_roster' webui/STATUS.md
grep -qE 'phase4432|through 4432|e2e-phase4432' webui/STATUS.md
echo "STATUS expect_steps_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4428 e2e passed"
