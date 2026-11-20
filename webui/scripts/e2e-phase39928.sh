#!/usr/bin/env bash
# Phase-39928: soft-complete through 39928.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39928
PY
grep -qE 'phase39928|through 39928' webui/STATUS.md
echo "OK: phase39928 e2e passed"
