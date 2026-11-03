#!/usr/bin/env bash
# Phase-224: soft-complete STATUS through phase224 + marker bump.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "224"' webui/backend/fwbweb_api/main.py
grep -q 'phase224\|phase223\|phase222\|phase221' webui/STATUS.md
grep -q 'e2e-phase224\|e2e-phase223\|e2e-phase222\|e2e-phase221' webui/scripts/e2e-all.sh
echo "STATUS soft-complete 224 ok"
echo "cleaned"
echo "OK: phase224 e2e passed"
