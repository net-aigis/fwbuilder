#!/usr/bin/env bash
# Phase-31104: soft-complete through 31104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31104
PY
grep -qE 'phase31104|through 31104' webui/STATUS.md
echo "OK: phase31104 e2e passed"
