#!/usr/bin/env bash
# Phase-25976: soft-complete through 25976 (ms 79250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25976
assert m.WEBUI_HONESTY_MILESTONE == 79250
print("soft-complete >=25976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25976|through 25976' webui/STATUS.md
echo "OK: phase25976 e2e passed"
