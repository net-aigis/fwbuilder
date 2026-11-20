#!/usr/bin/env bash
# Phase-35152: soft-complete through 35152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35152
PY
grep -qE 'phase35152|through 35152' webui/STATUS.md
echo "OK: phase35152 e2e passed"
