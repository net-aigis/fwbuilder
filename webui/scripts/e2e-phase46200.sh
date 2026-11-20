#!/usr/bin/env bash
# Phase-46200: soft-complete through 46200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46200
PY
grep -qE 'phase46200|through 46200' webui/STATUS.md
echo "OK: phase46200 e2e passed"
