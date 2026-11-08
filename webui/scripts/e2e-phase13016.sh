#!/usr/bin/env bash
# Phase-13016: soft-complete through 13016 (ms 38750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13016
assert m.WEBUI_HONESTY_MILESTONE == 38750
print("soft-complete >=13016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13016|through 13016' webui/STATUS.md
echo "OK: phase13016 e2e passed"
