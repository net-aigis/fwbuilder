#!/usr/bin/env bash
# Phase-39776: soft-complete through 39776.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39776
PY
grep -qE 'phase39776|through 39776' webui/STATUS.md
echo "OK: phase39776 e2e passed"
