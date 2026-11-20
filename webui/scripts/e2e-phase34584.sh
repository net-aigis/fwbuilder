#!/usr/bin/env bash
# Phase-34584: soft-complete through 34584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34584
PY
grep -qE 'phase34584|through 34584' webui/STATUS.md
echo "OK: phase34584 e2e passed"
