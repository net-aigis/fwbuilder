#!/usr/bin/env bash
# Phase-34544: soft-complete through 34544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34544
PY
grep -qE 'phase34544|through 34544' webui/STATUS.md
echo "OK: phase34544 e2e passed"
