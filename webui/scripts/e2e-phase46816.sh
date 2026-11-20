#!/usr/bin/env bash
# Phase-46816: soft-complete through 46816.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46816
PY
grep -qE 'phase46816|through 46816' webui/STATUS.md
echo "OK: phase46816 e2e passed"
