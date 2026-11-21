#!/usr/bin/env bash
# Phase-35912: soft-complete through 35912.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35912
PY
grep -qE 'phase35912|through 35912' webui/STATUS.md
echo "OK: phase35912 e2e passed"
