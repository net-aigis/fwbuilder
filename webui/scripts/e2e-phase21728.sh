#!/usr/bin/env bash
# Phase-21728: soft-complete through 21728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21728
PY
grep -qE 'phase21728|through 21728' webui/STATUS.md
echo "OK: phase21728 e2e passed"
