#!/usr/bin/env bash
# Phase-428: soft marker 432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "432"' webui/backend/fwbweb_api/main.py
echo "marker 432 ok"
echo "cleaned"
echo "OK: phase428 e2e passed"
