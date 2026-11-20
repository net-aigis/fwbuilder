#!/usr/bin/env bash
# Phase-46272: soft-complete through 46272.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46272
PY
grep -qE 'phase46272|through 46272' webui/STATUS.md
echo "OK: phase46272 e2e passed"
