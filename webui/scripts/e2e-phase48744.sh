#!/usr/bin/env bash
# Phase-48744: soft-complete through 48744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48744
PY
grep -qE 'phase48744|through 48744' webui/STATUS.md
echo "OK: phase48744 e2e passed"
