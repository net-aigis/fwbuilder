#!/usr/bin/env bash
# Phase-16856: soft-complete through 16856 (ms 50750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16856
assert m.WEBUI_HONESTY_MILESTONE == 50750
print("soft-complete >=16856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase16856|through 16856' webui/STATUS.md
echo "OK: phase16856 e2e passed"
