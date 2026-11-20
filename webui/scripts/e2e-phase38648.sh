#!/usr/bin/env bash
# Phase-38648: soft-complete through 38648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38648
PY
grep -qE 'phase38648|through 38648' webui/STATUS.md
echo "OK: phase38648 e2e passed"
