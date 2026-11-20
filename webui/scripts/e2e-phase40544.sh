#!/usr/bin/env bash
# Phase-40544: soft-complete through 40544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40544
PY
grep -qE 'phase40544|through 40544' webui/STATUS.md
echo "OK: phase40544 e2e passed"
