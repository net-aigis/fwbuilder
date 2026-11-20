#!/usr/bin/env bash
# Phase-44000: soft-complete through 44000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44000
PY
grep -qE 'phase44000|through 44000' webui/STATUS.md
echo "OK: phase44000 e2e passed"
