#!/usr/bin/env bash
# Phase-4348: STATUS mentions expect_run_roster sessionStorage / 4345-4352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_run_roster.*(sessionStorage|Clear)|sessionStorage.*expect_run_roster' webui/STATUS.md
grep -qE 'phase4352|through 4352|e2e-phase4352' webui/STATUS.md
echo "STATUS expect_run_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4348 e2e passed"
