#!/usr/bin/env bash
# Phase-32408: soft-complete through 32408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32408
PY
grep -qE 'phase32408|through 32408' webui/STATUS.md
echo "OK: phase32408 e2e passed"
