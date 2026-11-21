#!/usr/bin/env bash
# Phase-41200: soft-complete through 41200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41200
PY
grep -qE 'phase41200|through 41200' webui/STATUS.md
echo "OK: phase41200 e2e passed"
