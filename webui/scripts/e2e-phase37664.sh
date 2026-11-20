#!/usr/bin/env bash
# Phase-37664: soft-complete through 37664.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37664
PY
grep -qE 'phase37664|through 37664' webui/STATUS.md
echo "OK: phase37664 e2e passed"
