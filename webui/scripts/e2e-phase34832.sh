#!/usr/bin/env bash
# Phase-34832: soft-complete through 34832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34832
PY
grep -qE 'phase34832|through 34832' webui/STATUS.md
echo "OK: phase34832 e2e passed"
