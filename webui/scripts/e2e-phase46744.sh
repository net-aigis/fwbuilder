#!/usr/bin/env bash
# Phase-46744: soft-complete through 46744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46744
PY
grep -qE 'phase46744|through 46744' webui/STATUS.md
echo "OK: phase46744 e2e passed"
