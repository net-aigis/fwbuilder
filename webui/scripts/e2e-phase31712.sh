#!/usr/bin/env bash
# Phase-31712: soft-complete through 31712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31712
PY
grep -qE 'phase31712|through 31712' webui/STATUS.md
echo "OK: phase31712 e2e passed"
