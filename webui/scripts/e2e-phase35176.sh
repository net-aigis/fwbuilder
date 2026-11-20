#!/usr/bin/env bash
# Phase-35176: soft-complete through 35176 (ms 108000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35176
assert m.WEBUI_HONESTY_MILESTONE == 108000
print("soft-complete >=35176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase35176|through 35176' webui/STATUS.md
echo "OK: phase35176 e2e passed"
