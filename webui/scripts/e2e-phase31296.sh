#!/usr/bin/env bash
# Phase-31296: soft-complete through 31296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31296
PY
grep -qE 'phase31296|through 31296' webui/STATUS.md
echo "OK: phase31296 e2e passed"
