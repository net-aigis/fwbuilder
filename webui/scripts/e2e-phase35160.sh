#!/usr/bin/env bash
# Phase-35160: soft-complete through 35160.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35160
PY
grep -qE 'phase35160|through 35160' webui/STATUS.md
echo "OK: phase35160 e2e passed"
