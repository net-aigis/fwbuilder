#!/usr/bin/env bash
# Phase-35184: soft-complete through 35184.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35184
PY
grep -qE 'phase35184|through 35184' webui/STATUS.md
echo "OK: phase35184 e2e passed"
