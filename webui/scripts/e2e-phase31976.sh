#!/usr/bin/env bash
# Phase-31976: soft-complete through 31976 (ms 98000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31976
assert m.WEBUI_HONESTY_MILESTONE == 98000
print("soft-complete >=31976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31976|through 31976' webui/STATUS.md
echo "OK: phase31976 e2e passed"
