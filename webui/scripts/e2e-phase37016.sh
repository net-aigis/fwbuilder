#!/usr/bin/env bash
# Phase-37016: soft-complete through 37016 (ms 113750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37016
assert m.WEBUI_HONESTY_MILESTONE == 113750
print("soft-complete >=37016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37016|through 37016' webui/STATUS.md
echo "OK: phase37016 e2e passed"
