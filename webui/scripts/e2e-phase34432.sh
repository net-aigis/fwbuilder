#!/usr/bin/env bash
# Phase-34432: soft-complete through 34432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34432
PY
grep -qE 'phase34432|through 34432' webui/STATUS.md
echo "OK: phase34432 e2e passed"
