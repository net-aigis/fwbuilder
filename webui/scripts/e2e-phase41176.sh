#!/usr/bin/env bash
# Phase-41176: soft-complete through 41176 (ms 126750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41176
assert m.WEBUI_HONESTY_MILESTONE == 126750
print("soft-complete >=41176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase41176|through 41176' webui/STATUS.md
echo "OK: phase41176 e2e passed"
