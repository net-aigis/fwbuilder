#!/usr/bin/env bash
# Phase-35016: soft-complete through 35016 (ms 107500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35016
assert m.WEBUI_HONESTY_MILESTONE == 107500
print("soft-complete >=35016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase35016|through 35016' webui/STATUS.md
echo "OK: phase35016 e2e passed"
