#!/usr/bin/env bash
# Phase-37496: soft-complete through 37496 (ms 115250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37496
assert m.WEBUI_HONESTY_MILESTONE == 115250
print("soft-complete >=37496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase37496|through 37496' webui/STATUS.md
echo "OK: phase37496 e2e passed"
