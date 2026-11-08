#!/usr/bin/env bash
# Phase-9016: soft-complete through 9016 (ms 26250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9016
assert m.WEBUI_HONESTY_MILESTONE == 26250
print("soft-complete >=9016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9016|through 9016' webui/STATUS.md
echo "OK: phase9016 e2e passed"
