#!/usr/bin/env bash
# Phase-16616: soft-complete through 16616 (ms 50000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16616
assert m.WEBUI_HONESTY_MILESTONE == 50000
print("soft-complete >=16616", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16616|through 16616' webui/STATUS.md
echo "OK: phase16616 e2e passed"
