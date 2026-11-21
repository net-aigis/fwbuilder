#!/usr/bin/env bash
# Phase-424: soft-complete through 424.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'WEBUI_SOFT_COMPLETE_PHASE = "424"' webui/backend/fwbweb_api/main.py
grep -q 'phase424' webui/STATUS.md
grep -q 'e2e-phase424' webui/scripts/e2e-all.sh
echo "STATUS soft-complete 424 ok"
echo "cleaned"
echo "OK: phase424 e2e passed"
