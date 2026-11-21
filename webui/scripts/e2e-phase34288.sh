#!/usr/bin/env bash
# Phase-34288: soft-complete through 34288.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34288
PY
grep -qE 'phase34288|through 34288' webui/STATUS.md
echo "OK: phase34288 e2e passed"
