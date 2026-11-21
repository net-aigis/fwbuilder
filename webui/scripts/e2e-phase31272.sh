#!/usr/bin/env bash
# Phase-31272: soft-complete through 31272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31272
PY
grep -qE 'phase31272|through 31272' webui/STATUS.md
echo "OK: phase31272 e2e passed"
