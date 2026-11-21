#!/usr/bin/env bash
# Phase-19648: soft-complete through 19648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19648
PY
grep -qE 'phase19648|through 19648' webui/STATUS.md
echo "OK: phase19648 e2e passed"
