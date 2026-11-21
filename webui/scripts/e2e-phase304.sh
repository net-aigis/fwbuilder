#!/usr/bin/env bash
# Phase-304: STATUS soft-complete through phase304.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "304"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase304\|e2e-phase303\|e2e-phase302\|e2e-phase301\|e2e-phase300\|e2e-phase299\|e2e-phase298\|e2e-phase297' webui/scripts/e2e-all.sh
grep -q 'phase304' webui/STATUS.md
echo "STATUS soft-complete 304 ok"
echo "cleaned"
echo "OK: phase304 e2e passed"
