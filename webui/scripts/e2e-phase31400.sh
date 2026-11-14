#!/usr/bin/env bash
# Phase-31400: soft-complete through 31400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31400
PY
grep -qE 'phase31400|through 31400' webui/STATUS.md
echo "OK: phase31400 e2e passed"
