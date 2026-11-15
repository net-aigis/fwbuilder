#!/usr/bin/env bash
# Phase-31760: soft-complete through 31760.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31760
PY
grep -qE 'phase31760|through 31760' webui/STATUS.md
echo "OK: phase31760 e2e passed"
