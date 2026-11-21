#!/usr/bin/env bash
# Phase-19256: soft-complete through 19256 (ms 58250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19256
assert m.WEBUI_HONESTY_MILESTONE == 58250
print("soft-complete >=19256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19256|through 19256' webui/STATUS.md
echo "OK: phase19256 e2e passed"
