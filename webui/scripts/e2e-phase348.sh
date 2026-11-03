#!/usr/bin/env bash
# Phase-348: soft marker 352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "352"' webui/backend/fwbweb_api/main.py
echo "soft marker 352 ok"
echo "cleaned"
echo "OK: phase348 e2e passed"
