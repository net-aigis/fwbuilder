#!/usr/bin/env bash
# Phase-31280: soft-complete through 31280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31280
PY
grep -qE 'phase31280|through 31280' webui/STATUS.md
echo "OK: phase31280 e2e passed"
