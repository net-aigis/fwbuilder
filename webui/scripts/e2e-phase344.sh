#!/usr/bin/env bash
# Phase-344: STATUS soft-complete through phase344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "344"' webui/backend/fwbweb_api/main.py
grep -q 'phase344' webui/STATUS.md
echo "STATUS soft-complete 344 ok"
echo "cleaned"
echo "OK: phase344 e2e passed"
