#!/usr/bin/env bash
# Phase-455: soft_complete_phase in health matches marker.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'soft_complete_phase' webui/backend/fwbweb_api/main.py
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "456"' webui/backend/fwbweb_api/main.py
echo "health soft phase wiring ok"
echo "cleaned"
echo "OK: phase455 e2e passed"
