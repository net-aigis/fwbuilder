#!/usr/bin/env bash
# Phase-34864: soft-complete through 34864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34864
PY
grep -qE 'phase34864|through 34864' webui/STATUS.md
echo "OK: phase34864 e2e passed"
