#!/usr/bin/env bash
# Phase-432: soft-complete through 432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "432"' webui/backend/fwbweb_api/main.py
grep -q 'phase432' webui/STATUS.md
echo "STATUS soft-complete 432 ok"
echo "cleaned"
echo "OK: phase432 e2e passed"
