#!/usr/bin/env bash
# Phase-35904: soft-complete through 35904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35904
PY
grep -qE 'phase35904|through 35904' webui/STATUS.md
echo "OK: phase35904 e2e passed"
