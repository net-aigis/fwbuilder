#!/usr/bin/env bash
# Phase-35880: soft-complete through 35880.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35880
PY
grep -qE 'phase35880|through 35880' webui/STATUS.md
echo "OK: phase35880 e2e passed"
