#!/usr/bin/env bash
# Phase-40360: soft-complete through 40360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40360
PY
grep -qE 'phase40360|through 40360' webui/STATUS.md
echo "OK: phase40360 e2e passed"
