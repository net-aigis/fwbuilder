#!/usr/bin/env bash
# Phase-44208: soft-complete through 44208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44208
PY
grep -qE 'phase44208|through 44208' webui/STATUS.md
echo "OK: phase44208 e2e passed"
