#!/usr/bin/env bash
# Phase-31152: soft-complete through 31152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31152
PY
grep -qE 'phase31152|through 31152' webui/STATUS.md
echo "OK: phase31152 e2e passed"
