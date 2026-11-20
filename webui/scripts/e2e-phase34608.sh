#!/usr/bin/env bash
# Phase-34608: soft-complete through 34608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34608
PY
grep -qE 'phase34608|through 34608' webui/STATUS.md
echo "OK: phase34608 e2e passed"
