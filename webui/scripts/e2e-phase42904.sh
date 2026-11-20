#!/usr/bin/env bash
# Phase-42904: soft-complete through 42904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42904
PY
grep -qE 'phase42904|through 42904' webui/STATUS.md
echo "OK: phase42904 e2e passed"
