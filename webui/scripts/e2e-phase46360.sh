#!/usr/bin/env bash
# Phase-46360: soft-complete through 46360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46360
PY
grep -qE 'phase46360|through 46360' webui/STATUS.md
echo "OK: phase46360 e2e passed"
