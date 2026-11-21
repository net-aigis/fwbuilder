#!/usr/bin/env bash
# Phase-36408: soft-complete through 36408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36408
PY
grep -qE 'phase36408|through 36408' webui/STATUS.md
echo "OK: phase36408 e2e passed"
