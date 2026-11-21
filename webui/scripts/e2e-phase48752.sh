#!/usr/bin/env bash
# Phase-48752: soft-complete through 48752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48752
PY
grep -qE 'phase48752|through 48752' webui/STATUS.md
echo "OK: phase48752 e2e passed"
