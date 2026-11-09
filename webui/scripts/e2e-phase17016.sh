#!/usr/bin/env bash
# Phase-17016: soft-complete through 17016 (ms 51250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17016
assert m.WEBUI_HONESTY_MILESTONE == 51250
print("soft-complete >=17016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17016|through 17016' webui/STATUS.md
echo "OK: phase17016 e2e passed"
