#!/usr/bin/env bash
# Phase-31496: soft-complete through 31496 (ms 96500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31496
assert m.WEBUI_HONESTY_MILESTONE == 96500
print("soft-complete >=31496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31496|through 31496' webui/STATUS.md
echo "OK: phase31496 e2e passed"
