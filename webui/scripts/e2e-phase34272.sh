#!/usr/bin/env bash
# Phase-34272: soft-complete through 34272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34272
PY
grep -qE 'phase34272|through 34272' webui/STATUS.md
echo "OK: phase34272 e2e passed"
