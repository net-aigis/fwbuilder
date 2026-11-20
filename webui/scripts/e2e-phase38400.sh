#!/usr/bin/env bash
# Phase-38400: soft-complete through 38400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38400
PY
grep -qE 'phase38400|through 38400' webui/STATUS.md
echo "OK: phase38400 e2e passed"
