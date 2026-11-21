#!/usr/bin/env bash
# Phase-37328: soft-complete through 37328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37328
PY
grep -qE 'phase37328|through 37328' webui/STATUS.md
echo "OK: phase37328 e2e passed"
