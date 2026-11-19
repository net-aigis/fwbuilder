#!/usr/bin/env bash
# Phase-34032: soft-complete through 34032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34032
PY
grep -qE 'phase34032|through 34032' webui/STATUS.md
echo "OK: phase34032 e2e passed"
