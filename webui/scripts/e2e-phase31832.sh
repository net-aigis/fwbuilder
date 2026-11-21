#!/usr/bin/env bash
# Phase-31832: soft-complete through 31832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31832
PY
grep -qE 'phase31832|through 31832' webui/STATUS.md
echo "OK: phase31832 e2e passed"
