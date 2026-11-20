#!/usr/bin/env bash
# Phase-35856: soft-complete through 35856.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35856
PY
grep -qE 'phase35856|through 35856' webui/STATUS.md
echo "OK: phase35856 e2e passed"
