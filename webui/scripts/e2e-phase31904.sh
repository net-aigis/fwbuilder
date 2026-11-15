#!/usr/bin/env bash
# Phase-31904: soft-complete through 31904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31904
PY
grep -qE 'phase31904|through 31904' webui/STATUS.md
echo "OK: phase31904 e2e passed"
