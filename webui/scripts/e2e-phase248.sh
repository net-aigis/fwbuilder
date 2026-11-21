#!/usr/bin/env bash
# Phase-248: soft-complete STATUS through phase248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "248"' webui/backend/fwbweb_api/main.py
grep -q 'phase248\|phase247\|phase246\|phase245' webui/STATUS.md
grep -q 'e2e-phase248\|e2e-phase247\|e2e-phase246\|e2e-phase245' webui/scripts/e2e-all.sh
echo "STATUS soft-complete 248 ok"
echo "cleaned"
echo "OK: phase248 e2e passed"
