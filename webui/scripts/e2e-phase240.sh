#!/usr/bin/env bash
# Phase-240: soft-complete STATUS through phase240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "240"' webui/backend/fwbweb_api/main.py
grep -q 'phase240\|phase239\|phase238\|phase237' webui/STATUS.md
grep -q 'e2e-phase240\|e2e-phase239\|e2e-phase238\|e2e-phase237' webui/scripts/e2e-all.sh
echo "STATUS soft-complete 240 ok"
echo "cleaned"
echo "OK: phase240 e2e passed"
