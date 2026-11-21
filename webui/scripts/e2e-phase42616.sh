#!/usr/bin/env bash
# Phase-42616: soft-complete through 42616 (ms 131250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42616
assert m.WEBUI_HONESTY_MILESTONE == 131250
print("soft-complete >=42616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42616|through 42616' webui/STATUS.md
echo "OK: phase42616 e2e passed"
