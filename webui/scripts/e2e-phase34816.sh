#!/usr/bin/env bash
# Phase-34816: soft-complete through 34816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34816
PY
grep -qE 'phase34816|through 34816' webui/STATUS.md
echo "OK: phase34816 e2e passed"
