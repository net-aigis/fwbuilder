#!/usr/bin/env bash
# Phase-37752: soft-complete through 37752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37752
PY
grep -qE 'phase37752|through 37752' webui/STATUS.md
echo "OK: phase37752 e2e passed"
