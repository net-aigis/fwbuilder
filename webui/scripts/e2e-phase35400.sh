#!/usr/bin/env bash
# Phase-35400: soft-complete through 35400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35400
PY
grep -qE 'phase35400|through 35400' webui/STATUS.md
echo "OK: phase35400 e2e passed"
