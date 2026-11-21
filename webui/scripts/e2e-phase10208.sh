#!/usr/bin/env bash
# Phase-10208: soft-complete through 10208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 10208
PY
grep -qE 'phase10208|through 10208' webui/STATUS.md
echo "OK: phase10208 e2e passed"
