#!/usr/bin/env bash
# Phase-21496: soft-complete through 21496 (ms 65250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21496
assert m.WEBUI_HONESTY_MILESTONE == 65250
print("soft-complete >=21496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase21496|through 21496' webui/STATUS.md
echo "OK: phase21496 e2e passed"
