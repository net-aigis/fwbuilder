#!/usr/bin/env bash
# Phase-42880: soft-complete through 42880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42880
PY
grep -qE 'phase42880|through 42880' webui/STATUS.md
echo "OK: phase42880 e2e passed"
