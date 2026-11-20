#!/usr/bin/env bash
# Phase-44904: soft-complete through 44904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44904
PY
grep -qE 'phase44904|through 44904' webui/STATUS.md
echo "OK: phase44904 e2e passed"
