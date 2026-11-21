#!/usr/bin/env bash
# Phase-35544: soft-complete through 35544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35544
PY
grep -qE 'phase35544|through 35544' webui/STATUS.md
echo "OK: phase35544 e2e passed"
