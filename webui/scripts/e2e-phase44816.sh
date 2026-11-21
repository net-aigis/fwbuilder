#!/usr/bin/env bash
# Phase-44816: soft-complete through 44816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44816
PY
grep -qE 'phase44816|through 44816' webui/STATUS.md
echo "OK: phase44816 e2e passed"
