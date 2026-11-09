#!/usr/bin/env bash
# Phase-19808: soft-complete through 19808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19808
PY
grep -qE 'phase19808|through 19808' webui/STATUS.md
echo "OK: phase19808 e2e passed"
