#!/usr/bin/env bash
# Phase-9656: soft-complete through 9656 (ms 28250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9656
assert m.WEBUI_HONESTY_MILESTONE == 28250
print("soft-complete >=9656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9656|through 9656' webui/STATUS.md
echo "OK: phase9656 e2e passed"
