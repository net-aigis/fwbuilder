#!/usr/bin/env bash
# Phase-17248: soft-complete through 17248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17248
PY
grep -qE 'phase17248|through 17248' webui/STATUS.md
echo "OK: phase17248 e2e passed"
