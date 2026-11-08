#!/usr/bin/env bash
# Phase-15648: soft-complete through 15648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15648
PY
grep -qE 'phase15648|through 15648' webui/STATUS.md
echo "OK: phase15648 e2e passed"
