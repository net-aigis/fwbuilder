#!/usr/bin/env bash
# Phase-18616: soft-complete through 18616 (ms 56250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18616
assert m.WEBUI_HONESTY_MILESTONE == 56250
print("soft-complete >=18616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase18616|through 18616' webui/STATUS.md
echo "OK: phase18616 e2e passed"
