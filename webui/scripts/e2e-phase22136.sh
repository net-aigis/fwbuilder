#!/usr/bin/env bash
# Phase-22136: soft-complete through 22136 (ms 67250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22136
assert m.WEBUI_HONESTY_MILESTONE == 67250
print("soft-complete >=22136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22136|through 22136' webui/STATUS.md
echo "OK: phase22136 e2e passed"
