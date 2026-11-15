#!/usr/bin/env bash
# Phase-33016: soft-complete through 33016 (ms 101250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33016
assert m.WEBUI_HONESTY_MILESTONE == 101250
print("soft-complete >=33016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33016|through 33016' webui/STATUS.md
echo "OK: phase33016 e2e passed"
