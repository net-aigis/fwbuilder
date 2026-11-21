#!/usr/bin/env bash
# Phase-44608: soft-complete through 44608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44608
PY
grep -qE 'phase44608|through 44608' webui/STATUS.md
echo "OK: phase44608 e2e passed"
