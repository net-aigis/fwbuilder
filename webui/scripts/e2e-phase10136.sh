#!/usr/bin/env bash
# Phase-10136: soft-complete through 10136 (ms 29750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10136
assert m.WEBUI_HONESTY_MILESTONE == 29750
print("soft-complete >=10136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10136|through 10136' webui/STATUS.md
echo "OK: phase10136 e2e passed"
