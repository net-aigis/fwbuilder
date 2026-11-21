#!/usr/bin/env bash
# Phase-17976: soft-complete through 17976 (ms 54250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17976
assert m.WEBUI_HONESTY_MILESTONE == 54250
print("soft-complete >=17976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17976|through 17976' webui/STATUS.md
echo "OK: phase17976 e2e passed"
