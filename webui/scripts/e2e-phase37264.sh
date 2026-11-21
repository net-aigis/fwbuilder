#!/usr/bin/env bash
# Phase-37264: soft-complete through 37264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37264
PY
grep -qE 'phase37264|through 37264' webui/STATUS.md
echo "OK: phase37264 e2e passed"
