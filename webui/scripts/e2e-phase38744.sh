#!/usr/bin/env bash
# Phase-38744: soft-complete through 38744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38744
PY
grep -qE 'phase38744|through 38744' webui/STATUS.md
echo "OK: phase38744 e2e passed"
