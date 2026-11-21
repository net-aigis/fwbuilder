#!/usr/bin/env bash
# Phase-3500: STATUS mentions honesty_operator_brief_roster / 3497-3504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'honesty_operator_brief_roster|soft_fertig_honesty_operator_brief_roster' webui/STATUS.md
grep -qE 'phase3504|through 3504|e2e-phase3504' webui/STATUS.md
echo "STATUS honesty operator brief roster ok"
echo "cleaned"
echo "OK: phase3500 e2e passed"
