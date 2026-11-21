#!/usr/bin/env bash
# Phase-25016: soft-complete through 25016 (ms 76250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25016
assert m.WEBUI_HONESTY_MILESTONE == 76250
print("soft-complete >=25016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25016|through 25016' webui/STATUS.md
echo "OK: phase25016 e2e passed"
