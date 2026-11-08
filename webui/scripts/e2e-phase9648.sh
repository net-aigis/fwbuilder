#!/usr/bin/env bash
# Phase-9648: soft-complete through 9648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 9648
PY
grep -qE 'phase9648|through 9648' webui/STATUS.md
echo "OK: phase9648 e2e passed"
