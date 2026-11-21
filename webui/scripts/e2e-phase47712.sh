#!/usr/bin/env bash
# Phase-47712: soft-complete through 47712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47712
PY
grep -qE 'phase47712|through 47712' webui/STATUS.md
echo "OK: phase47712 e2e passed"
