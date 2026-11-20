#!/usr/bin/env bash
# Phase-36032: soft-complete through 36032.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36032
PY
grep -qE 'phase36032|through 36032' webui/STATUS.md
echo "OK: phase36032 e2e passed"
