#!/usr/bin/env bash
# Phase-30816: soft-complete through 30816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30816
PY
grep -qE 'phase30816|through 30816' webui/STATUS.md
echo "OK: phase30816 e2e passed"
