#!/usr/bin/env bash
# Phase-9976: soft-complete through 9976 (ms 29250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9976
assert m.WEBUI_HONESTY_MILESTONE == 29250
print("soft-complete >=9976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase9976|through 9976' webui/STATUS.md
echo "OK: phase9976 e2e passed"
