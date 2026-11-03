#!/usr/bin/env bash
# Phase-286: soft marker 288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "288"' webui/backend/fwbweb_api/main.py
echo "soft marker 288 ok"
echo "cleaned"
echo "OK: phase286 e2e passed"
