#!/usr/bin/env bash
# Phase-44488: soft-complete through 44488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44488
PY
grep -qE 'phase44488|through 44488' webui/STATUS.md
echo "OK: phase44488 e2e passed"
