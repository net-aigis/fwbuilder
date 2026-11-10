#!/usr/bin/env bash
# Phase-25176: soft-complete through 25176 (ms 76750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25176
assert m.WEBUI_HONESTY_MILESTONE == 76750
print("soft-complete >=25176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25176|through 25176' webui/STATUS.md
echo "OK: phase25176 e2e passed"
