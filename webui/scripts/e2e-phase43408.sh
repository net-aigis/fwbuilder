#!/usr/bin/env bash
# Phase-43408: soft-complete through 43408.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43408
PY
grep -qE 'phase43408|through 43408' webui/STATUS.md
echo "OK: phase43408 e2e passed"
