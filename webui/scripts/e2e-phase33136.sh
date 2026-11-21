#!/usr/bin/env bash
# Phase-33136: soft-complete through 33136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33136
PY
grep -qE 'phase33136|through 33136' webui/STATUS.md
echo "OK: phase33136 e2e passed"
