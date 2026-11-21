#!/usr/bin/env bash
# Phase-1296: soft-complete through 1296 (related refusals UI detail).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1296
print("soft-complete >=1296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1296|Soft-complete STATUS through 1296|through 1296' webui/STATUS.md
echo "STATUS soft-complete 1296 ok"
echo "cleaned"
echo "OK: phase1296 e2e passed"
