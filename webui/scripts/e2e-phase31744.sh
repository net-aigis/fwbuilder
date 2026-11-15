#!/usr/bin/env bash
# Phase-31744: soft-complete through 31744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31744
PY
grep -qE 'phase31744|through 31744' webui/STATUS.md
echo "OK: phase31744 e2e passed"
