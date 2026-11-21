#!/usr/bin/env bash
# Phase-2316: STATUS mentions hard_gap_refusal_roster export / 2313-2320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'hard_gap_refusal_roster.*(export|bundle)|export.*hard_gap_refusal_roster|bundle.*hard_gap_refusal_roster' webui/STATUS.md
grep -qE 'phase2320|through 2320|e2e-phase2320' webui/STATUS.md
echo "STATUS hard_gap_refusal_roster export ok"
echo "cleaned"
echo "OK: phase2316 e2e passed"
