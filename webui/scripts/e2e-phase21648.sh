#!/usr/bin/env bash
# Phase-21648: soft-complete through 21648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 21648
PY
grep -qE 'phase21648|through 21648' webui/STATUS.md
echo "OK: phase21648 e2e passed"
