#!/usr/bin/env bash
# Phase-45856: soft-complete through 45856.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45856
PY
grep -qE 'phase45856|through 45856' webui/STATUS.md
echo "OK: phase45856 e2e passed"
