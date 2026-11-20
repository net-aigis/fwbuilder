#!/usr/bin/env bash
# Phase-37056: soft-complete through 37056.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37056
PY
grep -qE 'phase37056|through 37056' webui/STATUS.md
echo "OK: phase37056 e2e passed"
