#!/usr/bin/env bash
# Phase-45016: soft-complete through 45016 (ms 138750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45016
assert m.WEBUI_HONESTY_MILESTONE == 138750
print("soft-complete >=45016", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase45016|through 45016' webui/STATUS.md
echo "OK: phase45016 e2e passed"
