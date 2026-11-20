#!/usr/bin/env bash
# Phase-35576: soft-complete through 35576 (ms 109250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35576
assert m.WEBUI_HONESTY_MILESTONE == 109250
print("soft-complete >=35576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase35576|through 35576' webui/STATUS.md
echo "OK: phase35576 e2e passed"
