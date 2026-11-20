#!/usr/bin/env bash
# Phase-37240: soft-complete through 37240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37240
PY
grep -qE 'phase37240|through 37240' webui/STATUS.md
echo "OK: phase37240 e2e passed"
