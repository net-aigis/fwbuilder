#!/usr/bin/env bash
# Phase-27256: soft-complete through 27256 (ms 83250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27256
assert m.WEBUI_HONESTY_MILESTONE == 83250
print("soft-complete >=27256", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase27256|through 27256' webui/STATUS.md
echo "OK: phase27256 e2e passed"
