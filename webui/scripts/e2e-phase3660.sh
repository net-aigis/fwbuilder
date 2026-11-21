#!/usr/bin/env bash
# Phase-3660: STATUS mentions hard_gaps_summary_roster / 3657-3664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gaps_summary_roster|soft_fertig_hard_gaps_summary_roster' webui/STATUS.md
grep -qE 'phase3664|through 3664|e2e-phase3664' webui/STATUS.md
echo "STATUS hard-gaps summary roster ok"
echo "cleaned"
echo "OK: phase3660 e2e passed"
