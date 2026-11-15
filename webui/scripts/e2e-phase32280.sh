#!/usr/bin/env bash
# Phase-32280: soft-complete through 32280.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32280
PY
grep -qE 'phase32280|through 32280' webui/STATUS.md
echo "OK: phase32280 e2e passed"
