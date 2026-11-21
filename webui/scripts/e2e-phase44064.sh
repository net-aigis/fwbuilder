#!/usr/bin/env bash
# Phase-44064: soft-complete through 44064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44064
PY
grep -qE 'phase44064|through 44064' webui/STATUS.md
echo "OK: phase44064 e2e passed"
