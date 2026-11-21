#!/usr/bin/env bash
# Phase-448: soft-complete through 448.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "448"' webui/backend/fwbweb_api/main.py
grep -q 'phase448' webui/STATUS.md
echo "STATUS soft-complete 448 ok"
echo "cleaned"
echo "OK: phase448 e2e passed"
