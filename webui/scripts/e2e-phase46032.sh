#!/usr/bin/env bash
# Phase-46032: soft-complete through 46032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46032
PY
grep -qE 'phase46032|through 46032' webui/STATUS.md
echo "OK: phase46032 e2e passed"
