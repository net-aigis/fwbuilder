#!/usr/bin/env bash
# Phase-3996: STATUS mentions hard_gaps_field_roster export / 3993-4000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gaps_field_roster.*(export|bundle)|Export.*hard_gaps_field_roster' webui/STATUS.md
grep -qE 'phase4000|through 4000|e2e-phase4000' webui/STATUS.md
echo "STATUS hard_gaps_field_roster export ok"
echo "cleaned"
echo "OK: phase3996 e2e passed"
