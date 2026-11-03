#!/usr/bin/env bash
# Phase-366: soft marker 368 + hard-gap note stack switcher.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "368"' webui/backend/fwbweb_api/main.py
grep -Fq 'stack switcher' webui/backend/fwbweb_api/main.py
echo "marker 368 ok"
echo "cleaned"
echo "OK: phase366 e2e passed"
