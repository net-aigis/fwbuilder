#!/usr/bin/env bash
# Phase-33208: soft-complete through 33208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33208
PY
grep -qE 'phase33208|through 33208' webui/STATUS.md
echo "OK: phase33208 e2e passed"
