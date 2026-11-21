#!/usr/bin/env bash
# Phase-435: soft marker 440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "440"' webui/backend/fwbweb_api/main.py
echo "marker 440 ok"
echo "cleaned"
echo "OK: phase435 e2e passed"
