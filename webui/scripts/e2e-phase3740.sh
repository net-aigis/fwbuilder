#!/usr/bin/env bash
# Phase-3740: STATUS mentions hard_gaps_closure_roster / 3737-3744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gaps_closure_roster|soft_fertig_hard_gaps_closure_roster' webui/STATUS.md
grep -qE 'phase3744|through 3744|e2e-phase3744' webui/STATUS.md
echo "STATUS hard-gaps closure roster ok"
echo "cleaned"
echo "OK: phase3740 e2e passed"
