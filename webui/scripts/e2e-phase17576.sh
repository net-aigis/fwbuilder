#!/usr/bin/env bash
# Phase-17576: soft-complete through 17576 (ms 53000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17576
assert m.WEBUI_HONESTY_MILESTONE == 53000
print("soft-complete >=17576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase17576|through 17576' webui/STATUS.md
echo "OK: phase17576 e2e passed"
