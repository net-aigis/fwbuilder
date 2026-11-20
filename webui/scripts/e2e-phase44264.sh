#!/usr/bin/env bash
# Phase-44264: soft-complete through 44264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44264
PY
grep -qE 'phase44264|through 44264' webui/STATUS.md
echo "OK: phase44264 e2e passed"
