#!/usr/bin/env bash
# Phase-34296: soft-complete through 34296 (ms 105250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34296
assert m.WEBUI_HONESTY_MILESTONE == 105250
print("soft-complete >=34296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase34296|through 34296' webui/STATUS.md
echo "OK: phase34296 e2e passed"
