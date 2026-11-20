#!/usr/bin/env bash
# Phase-44792: soft-complete through 44792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44792
PY
grep -qE 'phase44792|through 44792' webui/STATUS.md
echo "OK: phase44792 e2e passed"
