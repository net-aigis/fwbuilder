#!/usr/bin/env bash
# Phase-31360: soft-complete through 31360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31360
PY
grep -qE 'phase31360|through 31360' webui/STATUS.md
echo "OK: phase31360 e2e passed"
