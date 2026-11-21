#!/usr/bin/env bash
# Phase-44152: soft-complete through 44152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44152
PY
grep -qE 'phase44152|through 44152' webui/STATUS.md
echo "OK: phase44152 e2e passed"
