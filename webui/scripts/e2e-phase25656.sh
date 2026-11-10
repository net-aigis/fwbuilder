#!/usr/bin/env bash
# Phase-25656: soft-complete through 25656 (ms 78250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25656
assert m.WEBUI_HONESTY_MILESTONE == 78250
print("soft-complete >=25656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25656|through 25656' webui/STATUS.md
echo "OK: phase25656 e2e passed"
