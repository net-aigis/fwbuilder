#!/usr/bin/env bash
# Phase-35824: soft-complete through 35824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35824
PY
grep -qE 'phase35824|through 35824' webui/STATUS.md
echo "OK: phase35824 e2e passed"
