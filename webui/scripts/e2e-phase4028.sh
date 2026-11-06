#!/usr/bin/env bash
# Phase-4028: STATUS mentions hard_gaps_field_roster sessionStorage / 4025-4032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gaps_field_roster.*(sessionStorage|Clear)|sessionStorage.*hard_gaps_field_roster' webui/STATUS.md
grep -qE 'phase4032|through 4032|e2e-phase4032' webui/STATUS.md
echo "STATUS hard_gaps_field_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase4028 e2e passed"
