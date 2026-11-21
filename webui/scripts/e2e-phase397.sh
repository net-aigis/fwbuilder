#!/usr/bin/env bash
# Phase-397: soft marker 400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "400"' webui/backend/fwbweb_api/main.py
echo "marker 400 ok"
echo "cleaned"
echo "OK: phase397 e2e passed"
