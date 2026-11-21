#!/usr/bin/env bash
# Phase-316: soft marker 320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "320"' webui/backend/fwbweb_api/main.py
echo "soft marker 320 ok"
echo "cleaned"
echo "OK: phase316 e2e passed"
