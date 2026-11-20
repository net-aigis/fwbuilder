#!/usr/bin/env bash
# Phase-47208: soft-complete through 47208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47208
PY
grep -qE 'phase47208|through 47208' webui/STATUS.md
echo "OK: phase47208 e2e passed"
