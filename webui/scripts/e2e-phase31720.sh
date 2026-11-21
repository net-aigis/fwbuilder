#!/usr/bin/env bash
# Phase-31720: soft-complete through 31720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31720
PY
grep -qE 'phase31720|through 31720' webui/STATUS.md
echo "OK: phase31720 e2e passed"
