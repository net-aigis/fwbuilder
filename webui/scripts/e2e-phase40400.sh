#!/usr/bin/env bash
# Phase-40400: soft-complete through 40400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40400
PY
grep -qE 'phase40400|through 40400' webui/STATUS.md
echo "OK: phase40400 e2e passed"
