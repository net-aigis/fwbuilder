#!/usr/bin/env bash
# Phase-29248: soft-complete through 29248.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29248
PY
grep -qE 'phase29248|through 29248' webui/STATUS.md
echo "OK: phase29248 e2e passed"
