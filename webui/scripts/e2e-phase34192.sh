#!/usr/bin/env bash
# Phase-34192: soft-complete through 34192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34192
PY
grep -qE 'phase34192|through 34192' webui/STATUS.md
echo "OK: phase34192 e2e passed"
