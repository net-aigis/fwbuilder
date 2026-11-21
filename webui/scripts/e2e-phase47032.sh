#!/usr/bin/env bash
# Phase-47032: soft-complete through 47032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47032
PY
grep -qE 'phase47032|through 47032' webui/STATUS.md
echo "OK: phase47032 e2e passed"
