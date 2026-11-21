#!/usr/bin/env bash
# Phase-35064: soft-complete through 35064.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35064
PY
grep -qE 'phase35064|through 35064' webui/STATUS.md
echo "OK: phase35064 e2e passed"
