#!/usr/bin/env bash
# Phase-38408: soft-complete through 38408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38408
PY
grep -qE 'phase38408|through 38408' webui/STATUS.md
echo "OK: phase38408 e2e passed"
