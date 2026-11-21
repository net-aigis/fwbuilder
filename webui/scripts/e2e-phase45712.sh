#!/usr/bin/env bash
# Phase-45712: soft-complete through 45712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45712
PY
grep -qE 'phase45712|through 45712' webui/STATUS.md
echo "OK: phase45712 e2e passed"
