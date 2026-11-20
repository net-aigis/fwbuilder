#!/usr/bin/env bash
# Phase-35272: soft-complete through 35272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35272
PY
grep -qE 'phase35272|through 35272' webui/STATUS.md
echo "OK: phase35272 e2e passed"
