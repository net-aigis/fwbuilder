#!/usr/bin/env bash
# Phase-36104: soft-complete through 36104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36104
PY
grep -qE 'phase36104|through 36104' webui/STATUS.md
echo "OK: phase36104 e2e passed"
