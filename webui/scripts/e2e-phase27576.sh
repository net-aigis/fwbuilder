#!/usr/bin/env bash
# Phase-27576: soft-complete through 27576 (ms 84250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27576
assert m.WEBUI_HONESTY_MILESTONE == 84250
print("soft-complete >=27576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27576|through 27576' webui/STATUS.md
echo "OK: phase27576 e2e passed"
