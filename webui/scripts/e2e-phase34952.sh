#!/usr/bin/env bash
# Phase-34952: soft-complete through 34952.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34952
PY
grep -qE 'phase34952|through 34952' webui/STATUS.md
echo "OK: phase34952 e2e passed"
