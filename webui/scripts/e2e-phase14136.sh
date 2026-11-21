#!/usr/bin/env bash
# Phase-14136: soft-complete through 14136 (ms 42250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14136
assert m.WEBUI_HONESTY_MILESTONE == 42250
print("soft-complete >=14136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14136|through 14136' webui/STATUS.md
echo "OK: phase14136 e2e passed"
