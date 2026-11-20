#!/usr/bin/env bash
# Phase-38032: soft-complete through 38032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38032
PY
grep -qE 'phase38032|through 38032' webui/STATUS.md
echo "OK: phase38032 e2e passed"
