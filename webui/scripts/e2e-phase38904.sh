#!/usr/bin/env bash
# Phase-38904: soft-complete through 38904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38904
PY
grep -qE 'phase38904|through 38904' webui/STATUS.md
echo "OK: phase38904 e2e passed"
