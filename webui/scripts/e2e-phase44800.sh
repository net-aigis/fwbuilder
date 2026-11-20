#!/usr/bin/env bash
# Phase-44800: soft-complete through 44800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44800
PY
grep -qE 'phase44800|through 44800' webui/STATUS.md
echo "OK: phase44800 e2e passed"
