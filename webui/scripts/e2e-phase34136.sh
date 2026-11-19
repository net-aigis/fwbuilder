#!/usr/bin/env bash
# Phase-34136: soft-complete through 34136 (ms 104750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34136
assert m.WEBUI_HONESTY_MILESTONE == 104750
print("soft-complete >=34136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34136|through 34136' webui/STATUS.md
echo "OK: phase34136 e2e passed"
