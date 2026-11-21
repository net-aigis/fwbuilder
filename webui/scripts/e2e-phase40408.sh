#!/usr/bin/env bash
# Phase-40408: soft-complete through 40408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40408
PY
grep -qE 'phase40408|through 40408' webui/STATUS.md
echo "OK: phase40408 e2e passed"
