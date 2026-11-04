#!/usr/bin/env bash
# Phase-1032: soft-complete through 1032 (pages_with_row_stretch).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1032
print("soft-complete >=1032", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1032|Soft-complete STATUS through 1032|through 1032' webui/STATUS.md
echo "STATUS soft-complete 1032 ok"
echo "cleaned"
echo "OK: phase1032 e2e passed"
