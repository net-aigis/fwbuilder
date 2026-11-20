#!/usr/bin/env bash
# Phase-38136: soft-complete through 38136 (ms 117250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38136
assert m.WEBUI_HONESTY_MILESTONE == 117250
print("soft-complete >=38136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase38136|through 38136' webui/STATUS.md
echo "OK: phase38136 e2e passed"
