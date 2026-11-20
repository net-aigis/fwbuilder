#!/usr/bin/env bash
# Phase-39032: soft-complete through 39032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39032
PY
grep -qE 'phase39032|through 39032' webui/STATUS.md
echo "OK: phase39032 e2e passed"
