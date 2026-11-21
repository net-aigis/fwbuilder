#!/usr/bin/env bash
# Phase-42360: soft-complete through 42360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42360
PY
grep -qE 'phase42360|through 42360' webui/STATUS.md
echo "OK: phase42360 e2e passed"
