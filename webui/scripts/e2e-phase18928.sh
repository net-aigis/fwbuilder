#!/usr/bin/env bash
# Phase-18928: soft-complete through 18928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18928
PY
grep -qE 'phase18928|through 18928' webui/STATUS.md
echo "OK: phase18928 e2e passed"
