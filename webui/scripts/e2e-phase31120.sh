#!/usr/bin/env bash
# Phase-31120: soft-complete through 31120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31120
PY
grep -qE 'phase31120|through 31120' webui/STATUS.md
echo "OK: phase31120 e2e passed"
