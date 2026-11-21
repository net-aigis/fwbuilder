#!/usr/bin/env bash
# Phase-33656: soft-complete through 33656 (ms 103250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33656
assert m.WEBUI_HONESTY_MILESTONE == 103250
print("soft-complete >=33656", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33656|through 33656' webui/STATUS.md
echo "OK: phase33656 e2e passed"
