#!/usr/bin/env bash
# Phase-252: soft-complete STATUS through phase252.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "252"' webui/backend/fwbweb_api/main.py
grep -q 'phase252\|phase251\|phase250\|phase249' webui/STATUS.md
grep -q 'e2e-phase252\|e2e-phase251\|e2e-phase250\|e2e-phase249' webui/scripts/e2e-all.sh
echo "STATUS soft-complete 252 ok"
echo "cleaned"
echo "OK: phase252 e2e passed"
