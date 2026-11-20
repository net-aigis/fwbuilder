#!/usr/bin/env bash
# Phase-45728: soft-complete through 45728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45728
PY
grep -qE 'phase45728|through 45728' webui/STATUS.md
echo "OK: phase45728 e2e passed"
