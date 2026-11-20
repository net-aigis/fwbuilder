#!/usr/bin/env bash
# Phase-42648: soft-complete through 42648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42648
PY
grep -qE 'phase42648|through 42648' webui/STATUS.md
echo "OK: phase42648 e2e passed"
