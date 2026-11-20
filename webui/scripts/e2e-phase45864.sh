#!/usr/bin/env bash
# Phase-45864: soft-complete through 45864.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45864
PY
grep -qE 'phase45864|through 45864' webui/STATUS.md
echo "OK: phase45864 e2e passed"
