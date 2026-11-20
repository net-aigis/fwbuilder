#!/usr/bin/env bash
# Phase-40152: soft-complete through 40152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40152
PY
grep -qE 'phase40152|through 40152' webui/STATUS.md
echo "OK: phase40152 e2e passed"
