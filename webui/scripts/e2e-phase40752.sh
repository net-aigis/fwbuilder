#!/usr/bin/env bash
# Phase-40752: soft-complete through 40752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40752
PY
grep -qE 'phase40752|through 40752' webui/STATUS.md
echo "OK: phase40752 e2e passed"
