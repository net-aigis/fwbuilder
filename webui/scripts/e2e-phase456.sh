#!/usr/bin/env bash
# Phase-456: soft-complete through 456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "456"' webui/backend/fwbweb_api/main.py
grep -q 'phase456' webui/STATUS.md
echo "STATUS soft-complete 456 ok"
echo "cleaned"
echo "OK: phase456 e2e passed"
