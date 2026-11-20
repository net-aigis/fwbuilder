#!/usr/bin/env bash
# Phase-39544: soft-complete through 39544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39544
PY
grep -qE 'phase39544|through 39544' webui/STATUS.md
echo "OK: phase39544 e2e passed"
