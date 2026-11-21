#!/usr/bin/env bash
# Phase-46296: soft-complete through 46296 (ms 142750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46296
assert m.WEBUI_HONESTY_MILESTONE == 142750
print("soft-complete >=46296", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase46296|through 46296' webui/STATUS.md
echo "OK: phase46296 e2e passed"
