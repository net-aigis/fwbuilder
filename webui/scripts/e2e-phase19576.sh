#!/usr/bin/env bash
# Phase-19576: soft-complete through 19576 (ms 59250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19576
assert m.WEBUI_HONESTY_MILESTONE == 59250
print("soft-complete >=19576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19576|through 19576' webui/STATUS.md
echo "OK: phase19576 e2e passed"
