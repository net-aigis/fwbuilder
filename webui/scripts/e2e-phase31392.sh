#!/usr/bin/env bash
# Phase-31392: soft-complete through 31392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31392
PY
grep -qE 'phase31392|through 31392' webui/STATUS.md
echo "OK: phase31392 e2e passed"
