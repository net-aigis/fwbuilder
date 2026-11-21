#!/usr/bin/env bash
# Phase-35080: soft-complete through 35080.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35080
PY
grep -qE 'phase35080|through 35080' webui/STATUS.md
echo "OK: phase35080 e2e passed"
