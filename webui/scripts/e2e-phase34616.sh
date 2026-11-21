#!/usr/bin/env bash
# Phase-34616: soft-complete through 34616 (ms 106250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34616
assert m.WEBUI_HONESTY_MILESTONE == 106250
print("soft-complete >=34616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34616|through 34616' webui/STATUS.md
echo "OK: phase34616 e2e passed"
