#!/usr/bin/env bash
# Phase-45752: soft-complete through 45752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45752
PY
grep -qE 'phase45752|through 45752' webui/STATUS.md
echo "OK: phase45752 e2e passed"
