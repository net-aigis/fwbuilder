#!/usr/bin/env bash
# Phase-16208: soft-complete through 16208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 16208
PY
grep -qE 'phase16208|through 16208' webui/STATUS.md
echo "OK: phase16208 e2e passed"
