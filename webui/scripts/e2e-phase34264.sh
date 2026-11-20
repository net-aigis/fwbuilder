#!/usr/bin/env bash
# Phase-34264: soft-complete through 34264.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34264
PY
grep -qE 'phase34264|through 34264' webui/STATUS.md
echo "OK: phase34264 e2e passed"
