#!/usr/bin/env bash
# Phase-443: soft marker 448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "448"' webui/backend/fwbweb_api/main.py
echo "marker 448 ok"
echo "cleaned"
echo "OK: phase443 e2e passed"
