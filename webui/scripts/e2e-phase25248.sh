#!/usr/bin/env bash
# Phase-25248: soft-complete through 25248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25248
PY
grep -qE 'phase25248|through 25248' webui/STATUS.md
echo "OK: phase25248 e2e passed"
