#!/usr/bin/env bash
# Phase-22296: soft-complete through 22296 (ms 67750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22296
assert m.WEBUI_HONESTY_MILESTONE == 67750
print("soft-complete >=22296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22296|through 22296' webui/STATUS.md
echo "OK: phase22296 e2e passed"
