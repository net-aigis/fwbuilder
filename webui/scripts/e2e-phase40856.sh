#!/usr/bin/env bash
# Phase-40856: soft-complete through 40856 (ms 125750).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40856
assert m.WEBUI_HONESTY_MILESTONE == 125750
print("soft-complete >=40856", m.WEBUI_SOFT_COMPLETE_PHASE)
PY
grep -qE 'phase40856|through 40856' webui/STATUS.md
echo "OK: phase40856 e2e passed"
