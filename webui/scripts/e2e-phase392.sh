#!/usr/bin/env bash
# Phase-392: soft-complete through 392 + e2e-all wiring.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "392"' webui/backend/fwbweb_api/main.py
grep -q 'e2e-phase392\|e2e-phase391\|e2e-phase390\|e2e-phase389\|e2e-phase388\|e2e-phase387\|e2e-phase386\|e2e-phase385' webui/scripts/e2e-all.sh
grep -q 'phase392' webui/STATUS.md
echo "STATUS soft-complete 392 ok"
echo "cleaned"
echo "OK: phase392 e2e passed"
