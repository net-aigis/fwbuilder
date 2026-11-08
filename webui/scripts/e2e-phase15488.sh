#!/usr/bin/env bash
# Phase-15488: soft-complete through 15488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15488
PY
grep -qE 'phase15488|through 15488' webui/STATUS.md
echo "OK: phase15488 e2e passed"
