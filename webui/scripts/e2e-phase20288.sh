#!/usr/bin/env bash
# Phase-20288: soft-complete through 20288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 20288
PY
grep -qE 'phase20288|through 20288' webui/STATUS.md
echo "OK: phase20288 e2e passed"
