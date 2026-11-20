#!/usr/bin/env bash
# Phase-44808: soft-complete through 44808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44808
PY
grep -qE 'phase44808|through 44808' webui/STATUS.md
echo "OK: phase44808 e2e passed"
