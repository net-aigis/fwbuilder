#!/usr/bin/env bash
# Phase-3980: STATUS mentions hard_gaps_field_roster / 3977-3984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gaps_field_roster|soft_fertig_hard_gaps_field_roster' webui/STATUS.md
grep -qE 'phase3984|through 3984|e2e-phase3984' webui/STATUS.md
echo "STATUS hard-gaps field roster ok"
echo "cleaned"
echo "OK: phase3980 e2e passed"
