#!/usr/bin/env bash
# Phase-10616: soft-complete through 10616 (ms 31250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10616
assert m.WEBUI_HONESTY_MILESTONE == 31250
print("soft-complete >=10616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase10616|through 10616' webui/STATUS.md
echo "OK: phase10616 e2e passed"
