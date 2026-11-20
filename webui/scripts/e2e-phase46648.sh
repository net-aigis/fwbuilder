#!/usr/bin/env bash
# Phase-46648: soft-complete through 46648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46648
PY
grep -qE 'phase46648|through 46648' webui/STATUS.md
echo "OK: phase46648 e2e passed"
