#!/usr/bin/env bash
# Phase-3676: STATUS mentions hard_gaps_summary_roster export / 3673-3680.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gaps_summary_roster.*(export|bundle)|Export.*hard_gaps_summary_roster' webui/STATUS.md
grep -qE 'phase3680|through 3680|e2e-phase3680' webui/STATUS.md
echo "STATUS hard_gaps_summary_roster export ok"
echo "cleaned"
echo "OK: phase3676 e2e passed"
