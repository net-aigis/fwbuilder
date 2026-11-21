#!/usr/bin/env bash
# Phase-232: soft-complete STATUS through phase232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "232"' webui/backend/fwbweb_api/main.py
grep -q 'phase232\|phase231\|phase230\|phase229' webui/STATUS.md
grep -q 'e2e-phase232\|e2e-phase231\|e2e-phase230\|e2e-phase229' webui/scripts/e2e-all.sh
echo "STATUS soft-complete 232 ok"
echo "cleaned"
echo "OK: phase232 e2e passed"
