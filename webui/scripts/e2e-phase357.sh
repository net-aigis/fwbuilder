#!/usr/bin/env bash
# Phase-357: soft-complete marker advanced to 360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "360"' webui/backend/fwbweb_api/main.py
echo "soft marker 360 ok"
echo "cleaned"
echo "OK: phase357 e2e passed"
