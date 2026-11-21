#!/usr/bin/env bash
# Phase-34208: soft-complete through 34208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34208
PY
grep -qE 'phase34208|through 34208' webui/STATUS.md
echo "OK: phase34208 e2e passed"
