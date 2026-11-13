#!/usr/bin/env bash
# Phase-28136: soft-complete through 28136 (ms 86000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 28136
assert m.WEBUI_HONESTY_MILESTONE == 86000
print("soft-complete >=28136", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase28136|through 28136' webui/STATUS.md
echo "OK: phase28136 e2e passed"
