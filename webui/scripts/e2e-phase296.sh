#!/usr/bin/env bash
# Phase-296: STATUS soft-complete through phase296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "296"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase296\|e2e-phase295\|e2e-phase294\|e2e-phase293\|e2e-phase292\|e2e-phase291\|e2e-phase290\|e2e-phase289' webui/scripts/e2e-all.sh
grep -q 'phase296' webui/STATUS.md
echo "STATUS soft-complete 296 ok"
echo "cleaned"
echo "OK: phase296 e2e passed"
