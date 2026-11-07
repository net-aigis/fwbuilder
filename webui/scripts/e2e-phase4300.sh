#!/usr/bin/env bash
# Phase-4300: STATUS mentions expect_run_roster / 4297-4304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'expect_run_roster|soft_fertig_expect_run_roster' webui/STATUS.md
grep -qE 'phase4304|through 4304|e2e-phase4304' webui/STATUS.md
echo "STATUS expect-run roster ok"
echo "cleaned"
echo "OK: phase4300 e2e passed"
