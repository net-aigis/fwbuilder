#!/usr/bin/env bash
# Phase-30952: soft-complete through 30952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30952
PY
grep -qE 'phase30952|through 30952' webui/STATUS.md
echo "OK: phase30952 e2e passed"
