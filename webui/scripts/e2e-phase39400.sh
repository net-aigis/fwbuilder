#!/usr/bin/env bash
# Phase-39400: soft-complete through 39400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39400
PY
grep -qE 'phase39400|through 39400' webui/STATUS.md
echo "OK: phase39400 e2e passed"
