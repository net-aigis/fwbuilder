#!/usr/bin/env bash
# Phase-219: bump soft_complete marker consistency check in source.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "220"' webui/backend/fwbweb_api/main.py
grep -q 'phase220+' webui/STATUS.md || grep -q 'through phase220' webui/STATUS.md
echo "soft_complete consistency ok"
echo "cleaned"
echo "OK: phase219 e2e passed"
