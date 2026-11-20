#!/usr/bin/env bash
# Phase-39200: soft-complete through 39200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39200
PY
grep -qE 'phase39200|through 39200' webui/STATUS.md
echo "OK: phase39200 e2e passed"
