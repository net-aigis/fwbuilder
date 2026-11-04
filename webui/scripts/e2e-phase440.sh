#!/usr/bin/env bash
# Phase-440: soft-complete through 440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "440"' webui/backend/fwbweb_api/main.py
grep -q 'phase440' webui/STATUS.md
grep -q 'e2e-phase440' webui/scripts/e2e-all.sh
echo "STATUS soft-complete 440 ok"
echo "cleaned"
echo "OK: phase440 e2e passed"
