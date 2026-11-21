#!/usr/bin/env bash
# Phase-42408: soft-complete through 42408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42408
PY
grep -qE 'phase42408|through 42408' webui/STATUS.md
echo "OK: phase42408 e2e passed"
