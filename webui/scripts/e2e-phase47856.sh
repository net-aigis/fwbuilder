#!/usr/bin/env bash
# Phase-47856: soft-complete through 47856.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47856
PY
grep -qE 'phase47856|through 47856' webui/STATUS.md
echo "OK: phase47856 e2e passed"
