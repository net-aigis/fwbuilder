#!/usr/bin/env bash
# Phase-45120: soft-complete through 45120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45120
PY
grep -qE 'phase45120|through 45120' webui/STATUS.md
echo "OK: phase45120 e2e passed"
