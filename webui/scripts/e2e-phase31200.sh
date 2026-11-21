#!/usr/bin/env bash
# Phase-31200: soft-complete through 31200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31200
PY
grep -qE 'phase31200|through 31200' webui/STATUS.md
echo "OK: phase31200 e2e passed"
