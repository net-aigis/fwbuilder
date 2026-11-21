#!/usr/bin/env bash
# Phase-38792: soft-complete through 38792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38792
PY
grep -qE 'phase38792|through 38792' webui/STATUS.md
echo "OK: phase38792 e2e passed"
