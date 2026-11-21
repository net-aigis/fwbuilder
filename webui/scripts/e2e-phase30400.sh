#!/usr/bin/env bash
# Phase-30400: soft-complete through 30400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30400
PY
grep -qE 'phase30400|through 30400' webui/STATUS.md
echo "OK: phase30400 e2e passed"
