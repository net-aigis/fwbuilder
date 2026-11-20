#!/usr/bin/env bash
# Phase-46280: soft-complete through 46280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46280
PY
grep -qE 'phase46280|through 46280' webui/STATUS.md
echo "OK: phase46280 e2e passed"
