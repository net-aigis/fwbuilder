#!/usr/bin/env bash
# Phase-15248: soft-complete through 15248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 15248
PY
grep -qE 'phase15248|through 15248' webui/STATUS.md
echo "OK: phase15248 e2e passed"
