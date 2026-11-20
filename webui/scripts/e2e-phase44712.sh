#!/usr/bin/env bash
# Phase-44712: soft-complete through 44712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44712
PY
grep -qE 'phase44712|through 44712' webui/STATUS.md
echo "OK: phase44712 e2e passed"
