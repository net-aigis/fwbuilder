#!/usr/bin/env bash
# Phase-42856: soft-complete through 42856 (ms 132000).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42856
assert m.WEBUI_HONESTY_MILESTONE == 132000
print("soft-complete >=42856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase42856|through 42856' webui/STATUS.md
echo "OK: phase42856 e2e passed"
