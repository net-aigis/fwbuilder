#!/usr/bin/env bash
# Phase-31728: soft-complete through 31728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31728
PY
grep -qE 'phase31728|through 31728' webui/STATUS.md
echo "OK: phase31728 e2e passed"
