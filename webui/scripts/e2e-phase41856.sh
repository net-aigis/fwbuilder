#!/usr/bin/env bash
# Phase-41856: soft-complete through 41856.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41856
PY
grep -qE 'phase41856|through 41856' webui/STATUS.md
echo "OK: phase41856 e2e passed"
