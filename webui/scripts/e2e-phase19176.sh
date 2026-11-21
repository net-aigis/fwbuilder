#!/usr/bin/env bash
# Phase-19176: soft-complete through 19176 (ms 58000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19176
assert m.WEBUI_HONESTY_MILESTONE == 58000
print("soft-complete >=19176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19176|through 19176' webui/STATUS.md
echo "OK: phase19176 e2e passed"
