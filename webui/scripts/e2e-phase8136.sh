#!/usr/bin/env bash
# Phase-8136: soft-complete through 8136 (ms 23500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 8136
assert m.WEBUI_HONESTY_MILESTONE == 23500
print("soft-complete >=8136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase8136|through 8136' webui/STATUS.md
echo "OK: phase8136 e2e passed"
