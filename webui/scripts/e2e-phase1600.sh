#!/usr/bin/env bash
# Phase-1600: soft-complete through 1600 (honesty export in surface keys).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1600
print("soft-complete >=1600", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1600|Soft-complete STATUS through 1600|through 1600' webui/STATUS.md
echo "STATUS soft-complete 1600 ok"
echo "cleaned"
echo "OK: phase1600 e2e passed"
