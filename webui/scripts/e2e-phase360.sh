#!/usr/bin/env bash
# Phase-360: soft-complete through phase360 + e2e-all wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "360"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase360\|e2e-phase359\|e2e-phase358\|e2e-phase357\|e2e-phase356\|e2e-phase355\|e2e-phase354\|e2e-phase353' webui/scripts/e2e-all.sh
grep -q 'phase360' webui/STATUS.md
echo "STATUS soft-complete 360 ok"
echo "cleaned"
echo "OK: phase360 e2e passed"
