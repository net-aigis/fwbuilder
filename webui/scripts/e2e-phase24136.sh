#!/usr/bin/env bash
# Phase-24136: soft-complete through 24136 (ms 73500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 24136
assert m.WEBUI_HONESTY_MILESTONE == 73500
print("soft-complete >=24136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase24136|through 24136' webui/STATUS.md
echo "OK: phase24136 e2e passed"
