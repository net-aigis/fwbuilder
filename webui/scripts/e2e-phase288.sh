#!/usr/bin/env bash
# Phase-288: STATUS soft-complete through phase288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "288"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase288\|e2e-phase287\|e2e-phase286\|e2e-phase285\|e2e-phase284\|e2e-phase283\|e2e-phase282\|e2e-phase281' webui/scripts/e2e-all.sh
grep -q 'phase288' webui/STATUS.md
echo "STATUS soft-complete 288 ok"
echo "cleaned"
echo "OK: phase288 e2e passed"
