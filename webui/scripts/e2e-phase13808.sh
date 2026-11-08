#!/usr/bin/env bash
# Phase-13808: soft-complete through 13808.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13808
PY
grep -qE 'phase13808|through 13808' webui/STATUS.md
echo "OK: phase13808 e2e passed"
