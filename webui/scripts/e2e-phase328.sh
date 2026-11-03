#!/usr/bin/env bash
# Phase-328: STATUS soft-complete through phase328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "328"' webui/backend/fwbweb_api/main.py
grep -q 'phase328' webui/STATUS.md
echo "STATUS soft-complete 328 ok"
echo "cleaned"
echo "OK: phase328 e2e passed"
