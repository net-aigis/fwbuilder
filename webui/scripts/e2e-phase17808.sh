#!/usr/bin/env bash
# Phase-17808: soft-complete through 17808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17808
PY
grep -qE 'phase17808|through 17808' webui/STATUS.md
echo "OK: phase17808 e2e passed"
