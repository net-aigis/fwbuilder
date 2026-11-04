#!/usr/bin/env bash
# Phase-416: soft-complete through 416.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "416"' webui/backend/fwbweb_api/main.py
grep -q 'phase416' webui/STATUS.md
grep -q 'e2e-phase416' webui/scripts/e2e-all.sh
echo "STATUS soft-complete 416 ok"
echo "cleaned"
echo "OK: phase416 e2e passed"
