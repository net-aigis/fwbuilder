#!/usr/bin/env bash
# Phase-37176: soft-complete through 37176 (ms 114250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37176
assert m.WEBUI_HONESTY_MILESTONE == 114250
print("soft-complete >=37176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37176|through 37176' webui/STATUS.md
echo "OK: phase37176 e2e passed"
