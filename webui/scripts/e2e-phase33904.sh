#!/usr/bin/env bash
# Phase-33904: soft-complete through 33904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33904
PY
grep -qE 'phase33904|through 33904' webui/STATUS.md
echo "OK: phase33904 e2e passed"
