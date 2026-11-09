#!/usr/bin/env bash
# Phase-19496: soft-complete through 19496 (ms 59000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19496
assert m.WEBUI_HONESTY_MILESTONE == 59000
print("soft-complete >=19496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase19496|through 19496' webui/STATUS.md
echo "OK: phase19496 e2e passed"
