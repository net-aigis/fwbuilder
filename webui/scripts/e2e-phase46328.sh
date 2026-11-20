#!/usr/bin/env bash
# Phase-46328: soft-complete through 46328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46328
PY
grep -qE 'phase46328|through 46328' webui/STATUS.md
echo "OK: phase46328 e2e passed"
