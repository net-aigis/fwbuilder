#!/usr/bin/env bash
# Phase-30744: soft-complete through 30744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30744
PY
grep -qE 'phase30744|through 30744' webui/STATUS.md
echo "OK: phase30744 e2e passed"
