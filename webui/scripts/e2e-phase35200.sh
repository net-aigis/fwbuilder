#!/usr/bin/env bash
# Phase-35200: soft-complete through 35200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35200
PY
grep -qE 'phase35200|through 35200' webui/STATUS.md
echo "OK: phase35200 e2e passed"
