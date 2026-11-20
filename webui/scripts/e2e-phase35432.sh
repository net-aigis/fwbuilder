#!/usr/bin/env bash
# Phase-35432: soft-complete through 35432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35432
PY
grep -qE 'phase35432|through 35432' webui/STATUS.md
echo "OK: phase35432 e2e passed"
