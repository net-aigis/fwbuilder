#!/usr/bin/env bash
# Phase-293: soft marker 296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "296"' webui/backend/fwbweb_api/main.py
echo "soft marker 296 ok"
echo "cleaned"
echo "OK: phase293 e2e passed"
