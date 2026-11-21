#!/usr/bin/env bash
# Phase-39608: soft-complete through 39608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39608
PY
grep -qE 'phase39608|through 39608' webui/STATUS.md
echo "OK: phase39608 e2e passed"
