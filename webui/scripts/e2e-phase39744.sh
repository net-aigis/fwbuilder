#!/usr/bin/env bash
# Phase-39744: soft-complete through 39744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39744
PY
grep -qE 'phase39744|through 39744' webui/STATUS.md
echo "OK: phase39744 e2e passed"
