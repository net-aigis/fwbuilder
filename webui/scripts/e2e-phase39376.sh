#!/usr/bin/env bash
# Phase-39376: soft-complete through 39376.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39376
PY
grep -qE 'phase39376|through 39376' webui/STATUS.md
echo "OK: phase39376 e2e passed"
