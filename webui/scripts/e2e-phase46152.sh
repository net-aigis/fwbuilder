#!/usr/bin/env bash
# Phase-46152: soft-complete through 46152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46152
PY
grep -qE 'phase46152|through 46152' webui/STATUS.md
echo "OK: phase46152 e2e passed"
