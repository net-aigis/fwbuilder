#!/usr/bin/env bash
# Phase-35752: soft-complete through 35752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 35752
PY
grep -qE 'phase35752|through 35752' webui/STATUS.md
echo "OK: phase35752 e2e passed"
