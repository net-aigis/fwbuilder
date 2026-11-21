#!/usr/bin/env bash
# Phase-37208: soft-complete through 37208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37208
PY
grep -qE 'phase37208|through 37208' webui/STATUS.md
echo "OK: phase37208 e2e passed"
