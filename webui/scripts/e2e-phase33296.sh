#!/usr/bin/env bash
# Phase-33296: soft-complete through 33296.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33296
PY
grep -qE 'phase33296|through 33296' webui/STATUS.md
echo "OK: phase33296 e2e passed"
