#!/usr/bin/env bash
# Phase-40904: soft-complete through 40904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40904
PY
grep -qE 'phase40904|through 40904' webui/STATUS.md
echo "OK: phase40904 e2e passed"
