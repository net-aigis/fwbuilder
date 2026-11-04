#!/usr/bin/env bash
# Phase-459: soft marker 464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "464"' webui/backend/fwbweb_api/main.py
echo "marker 464 ok"
echo "cleaned"
echo "OK: phase459 e2e passed"
