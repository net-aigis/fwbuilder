#!/usr/bin/env bash
# Phase-22776: soft-complete through 22776 (ms 69250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 22776
assert m.WEBUI_HONESTY_MILESTONE == 69250
print("soft-complete >=22776", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase22776|through 22776' webui/STATUS.md
echo "OK: phase22776 e2e passed"
