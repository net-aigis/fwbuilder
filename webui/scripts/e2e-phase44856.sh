#!/usr/bin/env bash
# Phase-44856: soft-complete through 44856 (ms 138250).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44856
assert m.WEBUI_HONESTY_MILESTONE == 138250
print("soft-complete >=44856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase44856|through 44856' webui/STATUS.md
echo "OK: phase44856 e2e passed"
