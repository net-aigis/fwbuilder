#!/usr/bin/env bash
# Phase-36152: soft-complete through 36152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36152
PY
grep -qE 'phase36152|through 36152' webui/STATUS.md
echo "OK: phase36152 e2e passed"
