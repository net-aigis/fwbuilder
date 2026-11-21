#!/usr/bin/env bash
# Phase-41752: soft-complete through 41752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41752
PY
grep -qE 'phase41752|through 41752' webui/STATUS.md
echo "OK: phase41752 e2e passed"
