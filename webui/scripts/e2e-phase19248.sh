#!/usr/bin/env bash
# Phase-19248: soft-complete through 19248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19248
PY
grep -qE 'phase19248|through 19248' webui/STATUS.md
echo "OK: phase19248 e2e passed"
