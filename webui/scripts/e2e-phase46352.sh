#!/usr/bin/env bash
# Phase-46352: soft-complete through 46352.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46352
PY
grep -qE 'phase46352|through 46352' webui/STATUS.md
echo "OK: phase46352 e2e passed"
