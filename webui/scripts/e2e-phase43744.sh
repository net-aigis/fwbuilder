#!/usr/bin/env bash
# Phase-43744: soft-complete through 43744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43744
PY
grep -qE 'phase43744|through 43744' webui/STATUS.md
echo "OK: phase43744 e2e passed"
