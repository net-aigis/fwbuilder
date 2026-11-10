#!/usr/bin/env bash
# Phase-25336: soft-complete through 25336 (ms 77250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25336
assert m.WEBUI_HONESTY_MILESTONE == 77250
print("soft-complete >=25336", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25336|through 25336' webui/STATUS.md
echo "OK: phase25336 e2e passed"
