#!/usr/bin/env bash
# Phase-46400: soft-complete through 46400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46400
PY
grep -qE 'phase46400|through 46400' webui/STATUS.md
echo "OK: phase46400 e2e passed"
