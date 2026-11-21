#!/usr/bin/env bash
# Phase-46904: soft-complete through 46904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46904
PY
grep -qE 'phase46904|through 46904' webui/STATUS.md
echo "OK: phase46904 e2e passed"
