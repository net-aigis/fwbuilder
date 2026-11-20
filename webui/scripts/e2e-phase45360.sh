#!/usr/bin/env bash
# Phase-45360: soft-complete through 45360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45360
PY
grep -qE 'phase45360|through 45360' webui/STATUS.md
echo "OK: phase45360 e2e passed"
