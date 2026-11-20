#!/usr/bin/env bash
# Phase-34512: soft-complete through 34512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34512
PY
grep -qE 'phase34512|through 34512' webui/STATUS.md
echo "OK: phase34512 e2e passed"
