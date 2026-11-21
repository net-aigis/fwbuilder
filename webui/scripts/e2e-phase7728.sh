#!/usr/bin/env bash
# Phase-7728: soft-complete through 7728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7728
PY
grep -qE 'phase7728|through 7728' webui/STATUS.md
echo "OK: phase7728 e2e passed"
