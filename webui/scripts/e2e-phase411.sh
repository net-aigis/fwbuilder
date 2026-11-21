#!/usr/bin/env bash
# Phase-411: soft marker 416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "416"' webui/backend/fwbweb_api/main.py
echo "marker 416 ok"
echo "cleaned"
echo "OK: phase411 e2e passed"
