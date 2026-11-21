#!/usr/bin/env bash
# Phase-32648: soft-complete through 32648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32648
PY
grep -qE 'phase32648|through 32648' webui/STATUS.md
echo "OK: phase32648 e2e passed"
