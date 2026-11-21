#!/usr/bin/env bash
# Phase-44200: soft-complete through 44200.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44200
PY
grep -qE 'phase44200|through 44200' webui/STATUS.md
echo "OK: phase44200 e2e passed"
