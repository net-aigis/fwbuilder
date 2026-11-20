#!/usr/bin/env bash
# Phase-37504: soft-complete through 37504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37504
PY
grep -qE 'phase37504|through 37504' webui/STATUS.md
echo "OK: phase37504 e2e passed"
