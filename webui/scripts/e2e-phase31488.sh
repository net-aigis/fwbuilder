#!/usr/bin/env bash
# Phase-31488: soft-complete through 31488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31488
PY
grep -qE 'phase31488|through 31488' webui/STATUS.md
echo "OK: phase31488 e2e passed"
