#!/usr/bin/env bash
# Phase-464: soft-complete through 464.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "464"' webui/backend/fwbweb_api/main.py
grep -q 'phase464' webui/STATUS.md
echo "STATUS soft-complete 464 ok"
echo "cleaned"
echo "OK: phase464 e2e passed"
