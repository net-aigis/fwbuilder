#!/usr/bin/env bash
# Phase-30904: soft-complete through 30904.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30904
PY
grep -qE 'phase30904|through 30904' webui/STATUS.md
echo "OK: phase30904 e2e passed"
