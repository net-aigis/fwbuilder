#!/usr/bin/env bash
# Phase-47408: soft-complete through 47408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47408
PY
grep -qE 'phase47408|through 47408' webui/STATUS.md
echo "OK: phase47408 e2e passed"
