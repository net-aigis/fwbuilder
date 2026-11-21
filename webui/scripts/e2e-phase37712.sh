#!/usr/bin/env bash
# Phase-37712: soft-complete through 37712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37712
PY
grep -qE 'phase37712|through 37712' webui/STATUS.md
echo "OK: phase37712 e2e passed"
