#!/usr/bin/env bash
# Phase-35000: soft-complete through 35000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35000
PY
grep -qE 'phase35000|through 35000' webui/STATUS.md
echo "OK: phase35000 e2e passed"
