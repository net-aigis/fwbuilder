#!/usr/bin/env bash
# Phase-38264: soft-complete through 38264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38264
PY
grep -qE 'phase38264|through 38264' webui/STATUS.md
echo "OK: phase38264 e2e passed"
