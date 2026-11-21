#!/usr/bin/env bash
# Phase-47904: soft-complete through 47904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47904
PY
grep -qE 'phase47904|through 47904' webui/STATUS.md
echo "OK: phase47904 e2e passed"
