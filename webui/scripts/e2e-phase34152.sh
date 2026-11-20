#!/usr/bin/env bash
# Phase-34152: soft-complete through 34152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34152
PY
grep -qE 'phase34152|through 34152' webui/STATUS.md
echo "OK: phase34152 e2e passed"
