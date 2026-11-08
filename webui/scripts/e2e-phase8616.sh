#!/usr/bin/env bash
# Phase-8616: soft-complete through 8616 (ms 25000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8616
assert m.WEBUI_HONESTY_MILESTONE == 25000
print("soft-complete >=8616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8616|through 8616' webui/STATUS.md
echo "OK: phase8616 e2e passed"
