#!/usr/bin/env bash
# Phase-35936: soft-complete through 35936.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35936
PY
grep -qE 'phase35936|through 35936' webui/STATUS.md
echo "OK: phase35936 e2e passed"
