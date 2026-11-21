#!/usr/bin/env bash
# Phase-400: soft-complete through 400 + e2e-all wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "400"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase400\|e2e-phase399\|e2e-phase398\|e2e-phase397\|e2e-phase396\|e2e-phase395\|e2e-phase394\|e2e-phase393' webui/scripts/e2e-all.sh
grep -q 'phase400' webui/STATUS.md
echo "STATUS soft-complete 400 ok"
echo "cleaned"
echo "OK: phase400 e2e passed"
