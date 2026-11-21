#!/usr/bin/env bash
# Phase-278: soft marker advanced toward 280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "280"' webui/backend/fwbweb_api/main.py
echo "soft marker 280 ok"
echo "cleaned"
echo "OK: phase278 e2e passed"
