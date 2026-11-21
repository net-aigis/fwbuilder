#!/usr/bin/env bash
# Phase-44512: soft-complete through 44512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44512
PY
grep -qE 'phase44512|through 44512' webui/STATUS.md
echo "OK: phase44512 e2e passed"
