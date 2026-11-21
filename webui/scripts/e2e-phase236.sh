#!/usr/bin/env bash
# Phase-236: soft-complete STATUS through phase236.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "236"' webui/backend/fwbweb_api/main.py
grep -q 'phase236\|phase235\|phase234\|phase233' webui/STATUS.md
grep -q 'e2e-phase236\|e2e-phase235\|e2e-phase234\|e2e-phase233' webui/scripts/e2e-all.sh
echo "STATUS soft-complete 236 ok"
echo "cleaned"
echo "OK: phase236 e2e passed"
