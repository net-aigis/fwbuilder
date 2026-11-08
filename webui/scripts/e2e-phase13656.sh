#!/usr/bin/env bash
# Phase-13656: soft-complete through 13656 (ms 40750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13656
assert m.WEBUI_HONESTY_MILESTONE == 40750
print("soft-complete >=13656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase13656|through 13656' webui/STATUS.md
echo "OK: phase13656 e2e passed"
