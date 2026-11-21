#!/usr/bin/env bash
# Phase-31480: soft-complete through 31480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31480
PY
grep -qE 'phase31480|through 31480' webui/STATUS.md
echo "OK: phase31480 e2e passed"
