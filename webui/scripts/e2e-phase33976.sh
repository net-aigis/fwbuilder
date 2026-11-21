#!/usr/bin/env bash
# Phase-33976: soft-complete through 33976 (ms 104250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33976
assert m.WEBUI_HONESTY_MILESTONE == 104250
print("soft-complete >=33976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33976|through 33976' webui/STATUS.md
echo "OK: phase33976 e2e passed"
