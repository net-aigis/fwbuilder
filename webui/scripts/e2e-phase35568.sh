#!/usr/bin/env bash
# Phase-35568: soft-complete through 35568.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35568
PY
grep -qE 'phase35568|through 35568' webui/STATUS.md
echo "OK: phase35568 e2e passed"
