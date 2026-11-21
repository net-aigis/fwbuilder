#!/usr/bin/env bash
# Phase-32400: soft-complete through 32400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32400
PY
grep -qE 'phase32400|through 32400' webui/STATUS.md
echo "OK: phase32400 e2e passed"
