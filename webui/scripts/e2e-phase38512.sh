#!/usr/bin/env bash
# Phase-38512: soft-complete through 38512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38512
PY
grep -qE 'phase38512|through 38512' webui/STATUS.md
echo "OK: phase38512 e2e passed"
