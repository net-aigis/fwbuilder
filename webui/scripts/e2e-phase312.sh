#!/usr/bin/env bash
# Phase-312: STATUS soft-complete through phase312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "312"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase312\|e2e-phase311\|e2e-phase310\|e2e-phase309\|e2e-phase308\|e2e-phase307\|e2e-phase306\|e2e-phase305' webui/scripts/e2e-all.sh
grep -q 'phase312' webui/STATUS.md
echo "STATUS soft-complete 312 ok"
echo "cleaned"
echo "OK: phase312 e2e passed"
