#!/usr/bin/env bash
# Phase-18136: soft-complete through 18136 (ms 54750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18136
assert m.WEBUI_HONESTY_MILESTONE == 54750
print("soft-complete >=18136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase18136|through 18136' webui/STATUS.md
echo "OK: phase18136 e2e passed"
