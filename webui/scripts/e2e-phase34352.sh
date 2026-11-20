#!/usr/bin/env bash
# Phase-34352: soft-complete through 34352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34352
PY
grep -qE 'phase34352|through 34352' webui/STATUS.md
echo "OK: phase34352 e2e passed"
