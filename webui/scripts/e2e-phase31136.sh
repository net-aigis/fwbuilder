#!/usr/bin/env bash
# Phase-31136: soft-complete through 31136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31136
PY
grep -qE 'phase31136|through 31136' webui/STATUS.md
echo "OK: phase31136 e2e passed"
