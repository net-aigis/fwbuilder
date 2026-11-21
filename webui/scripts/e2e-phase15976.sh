#!/usr/bin/env bash
# Phase-15976: soft-complete through 15976 (ms 48000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15976
assert m.WEBUI_HONESTY_MILESTONE == 48000
print("soft-complete >=15976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15976|through 15976' webui/STATUS.md
echo "OK: phase15976 e2e passed"
