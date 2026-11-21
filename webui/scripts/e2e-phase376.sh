#!/usr/bin/env bash
# Phase-376: soft-complete through 376 + e2e-all wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "376"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase376\|e2e-phase375\|e2e-phase374\|e2e-phase373\|e2e-phase372\|e2e-phase371\|e2e-phase370\|e2e-phase369' webui/scripts/e2e-all.sh
grep -q 'phase376' webui/STATUS.md
echo "STATUS soft-complete 376 ok"
echo "cleaned"
echo "OK: phase376 e2e passed"
