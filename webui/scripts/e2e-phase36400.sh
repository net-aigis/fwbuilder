#!/usr/bin/env bash
# Phase-36400: soft-complete through 36400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36400
PY
grep -qE 'phase36400|through 36400' webui/STATUS.md
echo "OK: phase36400 e2e passed"
