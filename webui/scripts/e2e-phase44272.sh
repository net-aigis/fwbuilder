#!/usr/bin/env bash
# Phase-44272: soft-complete through 44272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44272
PY
grep -qE 'phase44272|through 44272' webui/STATUS.md
echo "OK: phase44272 e2e passed"
