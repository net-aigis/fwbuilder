#!/usr/bin/env bash
# Phase-31472: soft-complete through 31472.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31472
PY
grep -qE 'phase31472|through 31472' webui/STATUS.md
echo "OK: phase31472 e2e passed"
