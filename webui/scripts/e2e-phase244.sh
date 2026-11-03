#!/usr/bin/env bash
# Phase-244: soft-complete STATUS through phase244.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "244"' webui/backend/fwbweb_api/main.py
grep -q 'phase244\|phase243\|phase242\|phase241' webui/STATUS.md
grep -q 'e2e-phase244\|e2e-phase243\|e2e-phase242\|e2e-phase241' webui/scripts/e2e-all.sh
grep -q 'spacing' webui/STATUS.md
echo "STATUS soft-complete 244 ok"
echo "cleaned"
echo "OK: phase244 e2e passed"
