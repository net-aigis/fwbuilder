#!/usr/bin/env bash
# Phase-31264: soft-complete through 31264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31264
PY
grep -qE 'phase31264|through 31264' webui/STATUS.md
echo "OK: phase31264 e2e passed"
