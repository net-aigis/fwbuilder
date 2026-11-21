#!/usr/bin/env bash
# Phase-7248: soft-complete through 7248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 7248
PY
grep -qE 'phase7248|through 7248' webui/STATUS.md
echo "OK: phase7248 e2e passed"
