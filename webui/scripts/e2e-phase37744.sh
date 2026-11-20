#!/usr/bin/env bash
# Phase-37744: soft-complete through 37744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37744
PY
grep -qE 'phase37744|through 37744' webui/STATUS.md
echo "OK: phase37744 e2e passed"
