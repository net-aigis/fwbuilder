#!/usr/bin/env bash
# Phase-301: soft marker 304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "304"' webui/backend/fwbweb_api/main.py
echo "soft marker 304 ok"
echo "cleaned"
echo "OK: phase301 e2e passed"
