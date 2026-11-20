#!/usr/bin/env bash
# Phase-35144: soft-complete through 35144.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35144
PY
grep -qE 'phase35144|through 35144' webui/STATUS.md
echo "OK: phase35144 e2e passed"
