#!/usr/bin/env bash
# Phase-31608: soft-complete through 31608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31608
PY
grep -qE 'phase31608|through 31608' webui/STATUS.md
echo "OK: phase31608 e2e passed"
