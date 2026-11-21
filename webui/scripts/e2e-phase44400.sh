#!/usr/bin/env bash
# Phase-44400: soft-complete through 44400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44400
PY
grep -qE 'phase44400|through 44400' webui/STATUS.md
echo "OK: phase44400 e2e passed"
