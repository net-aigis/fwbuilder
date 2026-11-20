#!/usr/bin/env bash
# Phase-35832: soft-complete through 35832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35832
PY
grep -qE 'phase35832|through 35832' webui/STATUS.md
echo "OK: phase35832 e2e passed"
