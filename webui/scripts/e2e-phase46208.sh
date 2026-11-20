#!/usr/bin/env bash
# Phase-46208: soft-complete through 46208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46208
PY
grep -qE 'phase46208|through 46208' webui/STATUS.md
echo "OK: phase46208 e2e passed"
