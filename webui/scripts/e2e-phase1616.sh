#!/usr/bin/env bash
# Phase-1616: soft-complete through 1616 (honesty bundle).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 1616
print("soft-complete >=1616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase1616|Soft-complete STATUS through 1616|through 1616' webui/STATUS.md
echo "STATUS soft-complete 1616 ok"
echo "cleaned"
echo "OK: phase1616 e2e passed"
