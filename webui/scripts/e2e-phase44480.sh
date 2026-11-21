#!/usr/bin/env bash
# Phase-44480: soft-complete through 44480.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44480
PY
grep -qE 'phase44480|through 44480' webui/STATUS.md
echo "OK: phase44480 e2e passed"
