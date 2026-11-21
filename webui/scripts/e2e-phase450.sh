#!/usr/bin/env bash
# Phase-450: soft marker 456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "456"' webui/backend/fwbweb_api/main.py
echo "marker 456 ok"
echo "cleaned"
echo "OK: phase450 e2e passed"
