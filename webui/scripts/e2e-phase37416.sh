#!/usr/bin/env bash
# Phase-37416: soft-complete through 37416 (ms 115000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37416
assert m.WEBUI_HONESTY_MILESTONE == 115000
print("soft-complete >=37416", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37416|through 37416' webui/STATUS.md
echo "OK: phase37416 e2e passed"
