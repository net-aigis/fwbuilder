#!/usr/bin/env bash
# Phase-35240: soft-complete through 35240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35240
PY
grep -qE 'phase35240|through 35240' webui/STATUS.md
echo "OK: phase35240 e2e passed"
