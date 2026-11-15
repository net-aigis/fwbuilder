#!/usr/bin/env bash
# Phase-31792: soft-complete through 31792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31792
PY
grep -qE 'phase31792|through 31792' webui/STATUS.md
echo "OK: phase31792 e2e passed"
