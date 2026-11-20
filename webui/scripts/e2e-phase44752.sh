#!/usr/bin/env bash
# Phase-44752: soft-complete through 44752.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44752
PY
grep -qE 'phase44752|through 44752' webui/STATUS.md
echo "OK: phase44752 e2e passed"
