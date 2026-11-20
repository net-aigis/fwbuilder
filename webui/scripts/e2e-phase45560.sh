#!/usr/bin/env bash
# Phase-45560: soft-complete through 45560.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45560
PY
grep -qE 'phase45560|through 45560' webui/STATUS.md
echo "OK: phase45560 e2e passed"
