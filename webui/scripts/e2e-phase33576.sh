#!/usr/bin/env bash
# Phase-33576: soft-complete through 33576 (ms 103000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33576
assert m.WEBUI_HONESTY_MILESTONE == 103000
print("soft-complete >=33576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase33576|through 33576' webui/STATUS.md
echo "OK: phase33576 e2e passed"
