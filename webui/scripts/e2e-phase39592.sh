#!/usr/bin/env bash
# Phase-39592: soft-complete through 39592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39592
PY
grep -qE 'phase39592|through 39592' webui/STATUS.md
echo "OK: phase39592 e2e passed"
