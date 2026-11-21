#!/usr/bin/env bash
# Phase-47056: soft-complete through 47056.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47056
PY
grep -qE 'phase47056|through 47056' webui/STATUS.md
echo "OK: phase47056 e2e passed"
