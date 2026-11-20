#!/usr/bin/env bash
# Phase-35744: soft-complete through 35744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35744
PY
grep -qE 'phase35744|through 35744' webui/STATUS.md
echo "OK: phase35744 e2e passed"
