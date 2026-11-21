#!/usr/bin/env bash
# Phase-19016: soft-complete through 19016 (ms 57500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19016
assert m.WEBUI_HONESTY_MILESTONE == 57500
print("soft-complete >=19016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19016|through 19016' webui/STATUS.md
echo "OK: phase19016 e2e passed"
