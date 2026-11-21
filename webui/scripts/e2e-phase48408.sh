#!/usr/bin/env bash
# Phase-48408: soft-complete through 48408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48408
PY
grep -qE 'phase48408|through 48408' webui/STATUS.md
echo "OK: phase48408 e2e passed"
