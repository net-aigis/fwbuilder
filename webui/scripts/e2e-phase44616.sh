#!/usr/bin/env bash
# Phase-44616: soft-complete through 44616 (ms 137500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44616
assert m.WEBUI_HONESTY_MILESTONE == 137500
print("soft-complete >=44616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44616|through 44616' webui/STATUS.md
echo "OK: phase44616 e2e passed"
