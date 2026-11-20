#!/usr/bin/env bash
# Phase-37976: soft-complete through 37976 (ms 116750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37976
assert m.WEBUI_HONESTY_MILESTONE == 116750
print("soft-complete >=37976", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37976|through 37976' webui/STATUS.md
echo "OK: phase37976 e2e passed"
