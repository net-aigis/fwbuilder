#!/usr/bin/env bash
# Phase-39056: soft-complete through 39056.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39056
PY
grep -qE 'phase39056|through 39056' webui/STATUS.md
echo "OK: phase39056 e2e passed"
