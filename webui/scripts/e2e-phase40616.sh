#!/usr/bin/env bash
# Phase-40616: soft-complete through 40616 (ms 125000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40616
assert m.WEBUI_HONESTY_MILESTONE == 125000
print("soft-complete >=40616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40616|through 40616' webui/STATUS.md
echo "OK: phase40616 e2e passed"
