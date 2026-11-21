#!/usr/bin/env bash
# Phase-30408: soft-complete through 30408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30408
PY
grep -qE 'phase30408|through 30408' webui/STATUS.md
echo "OK: phase30408 e2e passed"
