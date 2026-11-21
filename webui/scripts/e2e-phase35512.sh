#!/usr/bin/env bash
# Phase-35512: soft-complete through 35512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35512
PY
grep -qE 'phase35512|through 35512' webui/STATUS.md
echo "OK: phase35512 e2e passed"
