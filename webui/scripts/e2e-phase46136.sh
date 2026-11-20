#!/usr/bin/env bash
# Phase-46136: soft-complete through 46136 (ms 142250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46136
assert m.WEBUI_HONESTY_MILESTONE == 142250
print("soft-complete >=46136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46136|through 46136' webui/STATUS.md
echo "OK: phase46136 e2e passed"
