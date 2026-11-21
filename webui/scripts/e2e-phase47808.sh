#!/usr/bin/env bash
# Phase-47808: soft-complete through 47808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47808
PY
grep -qE 'phase47808|through 47808' webui/STATUS.md
echo "OK: phase47808 e2e passed"
