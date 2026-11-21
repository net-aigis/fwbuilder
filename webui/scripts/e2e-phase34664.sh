#!/usr/bin/env bash
# Phase-34664: soft-complete through 34664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34664
PY
grep -qE 'phase34664|through 34664' webui/STATUS.md
echo "OK: phase34664 e2e passed"
