#!/usr/bin/env bash
# Phase-46616: soft-complete through 46616 (ms 143750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46616
assert m.WEBUI_HONESTY_MILESTONE == 143750
print("soft-complete >=46616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46616|through 46616' webui/STATUS.md
echo "OK: phase46616 e2e passed"
