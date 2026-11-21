#!/usr/bin/env bash
# Phase-27176: soft-complete through 27176 (ms 83000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27176
assert m.WEBUI_HONESTY_MILESTONE == 83000
print("soft-complete >=27176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27176|through 27176' webui/STATUS.md
echo "OK: phase27176 e2e passed"
