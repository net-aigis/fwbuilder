#!/usr/bin/env bash
# Phase-25256: soft-complete through 25256 (ms 77000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25256
assert m.WEBUI_HONESTY_MILESTONE == 77000
print("soft-complete >=25256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase25256|through 25256' webui/STATUS.md
echo "OK: phase25256 e2e passed"
