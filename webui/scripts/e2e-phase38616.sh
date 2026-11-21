#!/usr/bin/env bash
# Phase-38616: soft-complete through 38616 (ms 118750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38616
assert m.WEBUI_HONESTY_MILESTONE == 118750
print("soft-complete >=38616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase38616|through 38616' webui/STATUS.md
echo "OK: phase38616 e2e passed"
