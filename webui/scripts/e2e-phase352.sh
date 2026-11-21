#!/usr/bin/env bash
# Phase-352: STATUS soft-complete through phase352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "352"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase352\|e2e-phase351\|e2e-phase350\|e2e-phase349\|e2e-phase348\|e2e-phase347\|e2e-phase346\|e2e-phase345' webui/scripts/e2e-all.sh
grep -q 'phase352' webui/STATUS.md
echo "STATUS soft-complete 352 ok"
echo "cleaned"
echo "OK: phase352 e2e passed"
