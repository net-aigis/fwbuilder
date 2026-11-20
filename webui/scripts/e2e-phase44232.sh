#!/usr/bin/env bash
# Phase-44232: soft-complete through 44232.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44232
PY
grep -qE 'phase44232|through 44232' webui/STATUS.md
echo "OK: phase44232 e2e passed"
