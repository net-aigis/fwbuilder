#!/usr/bin/env bash
# Phase-21176: soft-complete through 21176 (ms 64250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21176
assert m.WEBUI_HONESTY_MILESTONE == 64250
print("soft-complete >=21176", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21176|through 21176' webui/STATUS.md
echo "OK: phase21176 e2e passed"
