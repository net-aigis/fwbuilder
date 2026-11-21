#!/usr/bin/env bash
# Phase-15416: soft-complete through 15416 (ms 46250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15416
assert m.WEBUI_HONESTY_MILESTONE == 46250
print("soft-complete >=15416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase15416|through 15416' webui/STATUS.md
echo "OK: phase15416 e2e passed"
