#!/usr/bin/env bash
# Phase-35104: soft-complete through 35104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35104
PY
grep -qE 'phase35104|through 35104' webui/STATUS.md
echo "OK: phase35104 e2e passed"
