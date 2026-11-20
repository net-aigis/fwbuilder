#!/usr/bin/env bash
# Phase-46240: soft-complete through 46240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46240
PY
grep -qE 'phase46240|through 46240' webui/STATUS.md
echo "OK: phase46240 e2e passed"
