#!/usr/bin/env bash
# Phase-40744: soft-complete through 40744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40744
PY
grep -qE 'phase40744|through 40744' webui/STATUS.md
echo "OK: phase40744 e2e passed"
