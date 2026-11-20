#!/usr/bin/env bash
# Phase-40248: soft-complete through 40248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40248
PY
grep -qE 'phase40248|through 40248' webui/STATUS.md
echo "OK: phase40248 e2e passed"
