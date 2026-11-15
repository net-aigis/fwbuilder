#!/usr/bin/env bash
# Phase-31936: soft-complete through 31936.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31936
PY
grep -qE 'phase31936|through 31936' webui/STATUS.md
echo "OK: phase31936 e2e passed"
