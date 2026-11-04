#!/usr/bin/env bash
# Phase-2236: STATUS mentions hard_gap_roster export / 2233-2240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gap_roster.*(export|bundle)|export.*hard_gap_roster|bundle.*hard_gap_roster' webui/STATUS.md
grep -qE 'phase2240|through 2240|e2e-phase2240' webui/STATUS.md
echo "STATUS hard_gap_roster export ok"
echo "cleaned"
echo "OK: phase2236 e2e passed"
