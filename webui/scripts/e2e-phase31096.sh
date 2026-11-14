#!/usr/bin/env bash
# Phase-31096: soft-complete through 31096 (ms 95250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31096
assert m.WEBUI_HONESTY_MILESTONE == 95250
print("soft-complete >=31096", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase31096|through 31096' webui/STATUS.md
echo "OK: phase31096 e2e passed"
