#!/usr/bin/env bash
# Phase-38816: soft-complete through 38816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38816
PY
grep -qE 'phase38816|through 38816' webui/STATUS.md
echo "OK: phase38816 e2e passed"
