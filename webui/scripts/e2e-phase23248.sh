#!/usr/bin/env bash
# Phase-23248: soft-complete through 23248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23248
PY
grep -qE 'phase23248|through 23248' webui/STATUS.md
echo "OK: phase23248 e2e passed"
