#!/usr/bin/env bash
# Phase-3708: STATUS mentions hard_gaps_summary_roster sessionStorage / 3705-3712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gaps_summary_roster.*(sessionStorage|Clear)|sessionStorage.*hard_gaps_summary_roster' webui/STATUS.md
grep -qE 'phase3712|through 3712|e2e-phase3712' webui/STATUS.md
echo "STATUS hard_gaps_summary_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3708 e2e passed"
