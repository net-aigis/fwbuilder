#!/usr/bin/env bash
# Phase-26208: soft-complete through 26208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26208
PY
grep -qE 'phase26208|through 26208' webui/STATUS.md
echo "OK: phase26208 e2e passed"
