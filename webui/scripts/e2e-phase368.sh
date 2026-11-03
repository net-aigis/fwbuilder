#!/usr/bin/env bash
# Phase-368: STATUS soft-complete through 368 + e2e-all wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "368"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase368\|e2e-phase367\|e2e-phase366\|e2e-phase365\|e2e-phase364\|e2e-phase363\|e2e-phase362\|e2e-phase361' webui/scripts/e2e-all.sh
grep -q 'phase368' webui/STATUS.md
grep -qi 'stack switcher\|Stack switcher\|empty.*stack' webui/STATUS.md
echo "STATUS soft-complete 368 ok"
echo "cleaned"
echo "OK: phase368 e2e passed"
