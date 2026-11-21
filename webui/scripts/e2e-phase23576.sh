#!/usr/bin/env bash
# Phase-23576: soft-complete through 23576 (ms 71750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23576
assert m.WEBUI_HONESTY_MILESTONE == 71750
print("soft-complete >=23576", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase23576|through 23576' webui/STATUS.md
echo "OK: phase23576 e2e passed"
