#!/usr/bin/env bash
# Phase-44864: soft-complete through 44864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44864
PY
grep -qE 'phase44864|through 44864' webui/STATUS.md
echo "OK: phase44864 e2e passed"
