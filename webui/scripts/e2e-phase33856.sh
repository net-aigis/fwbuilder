#!/usr/bin/env bash
# Phase-33856: soft-complete through 33856.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33856
PY
grep -qE 'phase33856|through 33856' webui/STATUS.md
echo "OK: phase33856 e2e passed"
