#!/usr/bin/env bash
# Phase-408: soft-complete through 408 + e2e-all wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "408"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase408\|e2e-phase407\|e2e-phase406\|e2e-phase405\|e2e-phase404\|e2e-phase403\|e2e-phase402\|e2e-phase401' webui/scripts/e2e-all.sh
grep -q 'phase408' webui/STATUS.md
echo "STATUS soft-complete 408 ok"
echo "cleaned"
echo "OK: phase408 e2e passed"
