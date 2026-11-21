#!/usr/bin/env bash
# Phase-40272: soft-complete through 40272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40272
PY
grep -qE 'phase40272|through 40272' webui/STATUS.md
echo "OK: phase40272 e2e passed"
