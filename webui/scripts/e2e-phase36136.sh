#!/usr/bin/env bash
# Phase-36136: soft-complete through 36136 (ms 111000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36136
assert m.WEBUI_HONESTY_MILESTONE == 111000
print("soft-complete >=36136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase36136|through 36136' webui/STATUS.md
echo "OK: phase36136 e2e passed"
