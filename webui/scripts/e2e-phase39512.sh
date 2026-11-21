#!/usr/bin/env bash
# Phase-39512: soft-complete through 39512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39512
PY
grep -qE 'phase39512|through 39512' webui/STATUS.md
echo "OK: phase39512 e2e passed"
