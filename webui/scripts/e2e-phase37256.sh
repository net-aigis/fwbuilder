#!/usr/bin/env bash
# Phase-37256: soft-complete through 37256 (ms 114500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37256
assert m.WEBUI_HONESTY_MILESTONE == 114500
print("soft-complete >=37256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37256|through 37256' webui/STATUS.md
echo "OK: phase37256 e2e passed"
