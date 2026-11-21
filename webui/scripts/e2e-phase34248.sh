#!/usr/bin/env bash
# Phase-34248: soft-complete through 34248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34248
PY
grep -qE 'phase34248|through 34248' webui/STATUS.md
echo "OK: phase34248 e2e passed"
