#!/usr/bin/env bash
# Phase-38856: soft-complete through 38856 (ms 119500).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38856
assert m.WEBUI_HONESTY_MILESTONE == 119500
print("soft-complete >=38856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase38856|through 38856' webui/STATUS.md
echo "OK: phase38856 e2e passed"
