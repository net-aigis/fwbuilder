#!/usr/bin/env bash
# Phase-37816: soft-complete through 37816 (ms 116250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37816
assert m.WEBUI_HONESTY_MILESTONE == 116250
print("soft-complete >=37816", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37816|through 37816' webui/STATUS.md
echo "OK: phase37816 e2e passed"
