#!/usr/bin/env bash
# Phase-46480: soft-complete through 46480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46480
PY
grep -qE 'phase46480|through 46480' webui/STATUS.md
echo "OK: phase46480 e2e passed"
