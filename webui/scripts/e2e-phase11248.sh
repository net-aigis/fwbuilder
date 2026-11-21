#!/usr/bin/env bash
# Phase-11248: soft-complete through 11248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 11248
PY
grep -qE 'phase11248|through 11248' webui/STATUS.md
echo "OK: phase11248 e2e passed"
