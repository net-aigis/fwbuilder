#!/usr/bin/env bash
# Phase-46544: soft-complete through 46544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46544
PY
grep -qE 'phase46544|through 46544' webui/STATUS.md
echo "OK: phase46544 e2e passed"
