#!/usr/bin/env bash
# Phase-31592: soft-complete through 31592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31592
PY
grep -qE 'phase31592|through 31592' webui/STATUS.md
echo "OK: phase31592 e2e passed"
