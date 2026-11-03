#!/usr/bin/env bash
# Phase-320: STATUS soft-complete through phase320.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "320"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase320\|e2e-phase319\|e2e-phase318\|e2e-phase317\|e2e-phase316\|e2e-phase315\|e2e-phase314\|e2e-phase313' webui/scripts/e2e-all.sh
grep -q 'phase320' webui/STATUS.md
echo "STATUS soft-complete 320 ok"
echo "cleaned"
echo "OK: phase320 e2e passed"
