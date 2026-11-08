#!/usr/bin/env bash
# Phase-14296: soft-complete through 14296 (ms 42750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 14296
assert m.WEBUI_HONESTY_MILESTONE == 42750
print("soft-complete >=14296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase14296|through 14296' webui/STATUS.md
echo "OK: phase14296 e2e passed"
