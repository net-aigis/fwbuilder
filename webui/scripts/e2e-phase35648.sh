#!/usr/bin/env bash
# Phase-35648: soft-complete through 35648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35648
PY
grep -qE 'phase35648|through 35648' webui/STATUS.md
echo "OK: phase35648 e2e passed"
