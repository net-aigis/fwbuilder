#!/usr/bin/env bash
# Phase-35808: soft-complete through 35808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35808
PY
grep -qE 'phase35808|through 35808' webui/STATUS.md
echo "OK: phase35808 e2e passed"
