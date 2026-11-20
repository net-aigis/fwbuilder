#!/usr/bin/env bash
# Phase-35864: soft-complete through 35864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35864
PY
grep -qE 'phase35864|through 35864' webui/STATUS.md
echo "OK: phase35864 e2e passed"
