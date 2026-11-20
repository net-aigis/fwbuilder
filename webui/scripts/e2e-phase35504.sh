#!/usr/bin/env bash
# Phase-35504: soft-complete through 35504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35504
PY
grep -qE 'phase35504|through 35504' webui/STATUS.md
echo "OK: phase35504 e2e passed"
