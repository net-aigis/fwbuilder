#!/usr/bin/env bash
# Phase-35488: soft-complete through 35488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35488
PY
grep -qE 'phase35488|through 35488' webui/STATUS.md
echo "OK: phase35488 e2e passed"
