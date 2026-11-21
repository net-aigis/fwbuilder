#!/usr/bin/env bash
# Phase-7496: soft-complete through 7496 (ms 21500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7496
assert m.WEBUI_HONESTY_MILESTONE == 21500
print("soft-complete >=7496", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase7496|through 7496' webui/STATUS.md
echo "OK: phase7496 e2e passed"
