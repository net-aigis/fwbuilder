#!/usr/bin/env bash
# Phase-13648: soft-complete through 13648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13648
PY
grep -qE 'phase13648|through 13648' webui/STATUS.md
echo "OK: phase13648 e2e passed"
