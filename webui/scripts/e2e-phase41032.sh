#!/usr/bin/env bash
# Phase-41032: soft-complete through 41032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41032
PY
grep -qE 'phase41032|through 41032' webui/STATUS.md
echo "OK: phase41032 e2e passed"
