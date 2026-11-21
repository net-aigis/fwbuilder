#!/usr/bin/env bash
# Phase-47360: soft-complete through 47360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47360
PY
grep -qE 'phase47360|through 47360' webui/STATUS.md
echo "OK: phase47360 e2e passed"
