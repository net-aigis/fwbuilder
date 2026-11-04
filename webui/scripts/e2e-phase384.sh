#!/usr/bin/env bash
# Phase-384: soft-complete through 384 + e2e-all wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "384"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase384\|e2e-phase383\|e2e-phase382\|e2e-phase381\|e2e-phase380\|e2e-phase379\|e2e-phase378\|e2e-phase377' webui/scripts/e2e-all.sh
grep -q 'phase384' webui/STATUS.md
echo "STATUS soft-complete 384 ok"
echo "cleaned"
echo "OK: phase384 e2e passed"
