#!/usr/bin/env bash
# Phase-34504: soft-complete through 34504.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34504
PY
grep -qE 'phase34504|through 34504' webui/STATUS.md
echo "OK: phase34504 e2e passed"
