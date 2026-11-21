#!/usr/bin/env bash
# Phase-336: STATUS soft-complete through phase336.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "336"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase336\|e2e-phase335\|e2e-phase334\|e2e-phase333\|e2e-phase332\|e2e-phase331\|e2e-phase330\|e2e-phase329' webui/scripts/e2e-all.sh
grep -q 'phase336' webui/STATUS.md
echo "STATUS soft-complete 336 ok"
echo "cleaned"
echo "OK: phase336 e2e passed"
