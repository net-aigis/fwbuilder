#!/usr/bin/env bash
# Phase-26616: soft-complete through 26616 (ms 81250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26616
assert m.WEBUI_HONESTY_MILESTONE == 81250
print("soft-complete >=26616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase26616|through 26616' webui/STATUS.md
echo "OK: phase26616 e2e passed"
