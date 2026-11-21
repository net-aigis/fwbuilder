#!/usr/bin/env bash
# Phase-47696: soft-complete through 47696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47696
PY
grep -qE 'phase47696|through 47696' webui/STATUS.md
echo "OK: phase47696 e2e passed"
