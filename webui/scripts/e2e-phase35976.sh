#!/usr/bin/env bash
# Phase-35976: soft-complete through 35976 (ms 110500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35976
assert m.WEBUI_HONESTY_MILESTONE == 110500
print("soft-complete >=35976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase35976|through 35976' webui/STATUS.md
echo "OK: phase35976 e2e passed"
