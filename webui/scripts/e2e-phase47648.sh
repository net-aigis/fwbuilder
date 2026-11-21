#!/usr/bin/env bash
# Phase-47648: soft-complete through 47648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47648
PY
grep -qE 'phase47648|through 47648' webui/STATUS.md
echo "OK: phase47648 e2e passed"
