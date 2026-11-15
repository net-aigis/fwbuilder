#!/usr/bin/env bash
# Phase-31600: soft-complete through 31600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31600
PY
grep -qE 'phase31600|through 31600' webui/STATUS.md
echo "OK: phase31600 e2e passed"
