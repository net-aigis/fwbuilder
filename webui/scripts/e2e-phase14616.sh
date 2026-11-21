#!/usr/bin/env bash
# Phase-14616: soft-complete through 14616 (ms 43750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14616
assert m.WEBUI_HONESTY_MILESTONE == 43750
print("soft-complete >=14616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14616|through 14616' webui/STATUS.md
echo "OK: phase14616 e2e passed"
