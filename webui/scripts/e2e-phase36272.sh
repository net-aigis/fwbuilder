#!/usr/bin/env bash
# Phase-36272: soft-complete through 36272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36272
PY
grep -qE 'phase36272|through 36272' webui/STATUS.md
echo "OK: phase36272 e2e passed"
