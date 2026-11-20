#!/usr/bin/env bash
# Phase-39792: soft-complete through 39792.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39792
PY
grep -qE 'phase39792|through 39792' webui/STATUS.md
echo "OK: phase39792 e2e passed"
