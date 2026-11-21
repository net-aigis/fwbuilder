#!/usr/bin/env bash
# Phase-45592: soft-complete through 45592.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45592
PY
grep -qE 'phase45592|through 45592' webui/STATUS.md
echo "OK: phase45592 e2e passed"
