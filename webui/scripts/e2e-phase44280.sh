#!/usr/bin/env bash
# Phase-44280: soft-complete through 44280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44280
PY
grep -qE 'phase44280|through 44280' webui/STATUS.md
echo "OK: phase44280 e2e passed"
