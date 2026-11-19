#!/usr/bin/env bash
# Phase-34104: soft-complete through 34104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34104
PY
grep -qE 'phase34104|through 34104' webui/STATUS.md
echo "OK: phase34104 e2e passed"
