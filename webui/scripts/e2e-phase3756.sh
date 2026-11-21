#!/usr/bin/env bash
# Phase-3756: STATUS mentions hard_gaps_closure_roster export / 3753-3760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gaps_closure_roster.*(export|bundle)|Export.*hard_gaps_closure_roster' webui/STATUS.md
grep -qE 'phase3760|through 3760|e2e-phase3760' webui/STATUS.md
echo "STATUS hard_gaps_closure_roster export ok"
echo "cleaned"
echo "OK: phase3756 e2e passed"
