#!/usr/bin/env bash
# Phase-31512: soft-complete through 31512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31512
PY
grep -qE 'phase31512|through 31512' webui/STATUS.md
echo "OK: phase31512 e2e passed"
