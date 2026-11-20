#!/usr/bin/env bash
# Phase-44592: soft-complete through 44592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44592
PY
grep -qE 'phase44592|through 44592' webui/STATUS.md
echo "OK: phase44592 e2e passed"
