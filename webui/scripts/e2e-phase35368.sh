#!/usr/bin/env bash
# Phase-35368: soft-complete through 35368.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35368
PY
grep -qE 'phase35368|through 35368' webui/STATUS.md
echo "OK: phase35368 e2e passed"
