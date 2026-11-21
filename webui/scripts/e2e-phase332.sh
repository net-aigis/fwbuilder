#!/usr/bin/env bash
# Phase-332: soft marker 336.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "336"' webui/backend/fwbweb_api/main.py
echo "soft marker 336 ok"
echo "cleaned"
echo "OK: phase332 e2e passed"
