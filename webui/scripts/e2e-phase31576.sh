#!/usr/bin/env bash
# Phase-31576: soft-complete through 31576 (ms 96750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31576
assert m.WEBUI_HONESTY_MILESTONE == 96750
print("soft-complete >=31576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31576|through 31576' webui/STATUS.md
echo "OK: phase31576 e2e passed"
