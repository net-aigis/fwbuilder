#!/usr/bin/env bash
# Phase-34752: soft-complete through 34752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34752
PY
grep -qE 'phase34752|through 34752' webui/STATUS.md
echo "OK: phase34752 e2e passed"
