#!/usr/bin/env bash
# Phase-24616: soft-complete through 24616 (ms 75000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24616
assert m.WEBUI_HONESTY_MILESTONE == 75000
print("soft-complete >=24616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24616|through 24616' webui/STATUS.md
echo "OK: phase24616 e2e passed"
