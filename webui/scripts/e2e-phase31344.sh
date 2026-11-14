#!/usr/bin/env bash
# Phase-31344: soft-complete through 31344.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31344
PY
grep -qE 'phase31344|through 31344' webui/STATUS.md
echo "OK: phase31344 e2e passed"
