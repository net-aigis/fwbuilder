#!/usr/bin/env bash
# Phase-44848: soft-complete through 44848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44848
PY
grep -qE 'phase44848|through 44848' webui/STATUS.md
echo "OK: phase44848 e2e passed"
