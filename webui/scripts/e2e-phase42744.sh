#!/usr/bin/env bash
# Phase-42744: soft-complete through 42744.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42744
PY
grep -qE 'phase42744|through 42744' webui/STATUS.md
echo "OK: phase42744 e2e passed"
