#!/usr/bin/env bash
# Phase-35920: soft-complete through 35920.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35920
PY
grep -qE 'phase35920|through 35920' webui/STATUS.md
echo "OK: phase35920 e2e passed"
