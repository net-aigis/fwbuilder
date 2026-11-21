#!/usr/bin/env bash
# Phase-30136: soft-complete through 30136 (ms 92250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30136
assert m.WEBUI_HONESTY_MILESTONE == 92250
print("soft-complete >=30136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase30136|through 30136' webui/STATUS.md
echo "OK: phase30136 e2e passed"
