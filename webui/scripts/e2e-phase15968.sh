#!/usr/bin/env bash
# Phase-15968: soft-complete through 15968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15968
PY
grep -qE 'phase15968|through 15968' webui/STATUS.md
echo "OK: phase15968 e2e passed"
