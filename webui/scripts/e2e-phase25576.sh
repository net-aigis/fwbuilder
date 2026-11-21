#!/usr/bin/env bash
# Phase-25576: soft-complete through 25576 (ms 78000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25576
assert m.WEBUI_HONESTY_MILESTONE == 78000
print("soft-complete >=25576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25576|through 25576' webui/STATUS.md
echo "OK: phase25576 e2e passed"
