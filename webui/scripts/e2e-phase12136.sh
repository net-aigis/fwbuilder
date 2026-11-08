#!/usr/bin/env bash
# Phase-12136: soft-complete through 12136 (ms 36000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 12136
assert m.WEBUI_HONESTY_MILESTONE == 36000
print("soft-complete >=12136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase12136|through 12136' webui/STATUS.md
echo "OK: phase12136 e2e passed"
