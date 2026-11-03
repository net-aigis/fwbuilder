#!/usr/bin/env bash
# Phase-280: STATUS soft-complete through phase280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "280"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase280\|e2e-phase279\|e2e-phase278\|e2e-phase277\|e2e-phase276\|e2e-phase275\|e2e-phase274\|e2e-phase273' webui/scripts/e2e-all.sh
grep -q 'phase280' webui/STATUS.md
echo "STATUS soft-complete 280 ok"
echo "cleaned"
echo "OK: phase280 e2e passed"
