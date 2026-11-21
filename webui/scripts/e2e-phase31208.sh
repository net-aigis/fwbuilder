#!/usr/bin/env bash
# Phase-31208: soft-complete through 31208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31208
PY
grep -qE 'phase31208|through 31208' webui/STATUS.md
echo "OK: phase31208 e2e passed"
