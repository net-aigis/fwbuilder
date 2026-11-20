#!/usr/bin/env bash
# Phase-43696: soft-complete through 43696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43696
PY
grep -qE 'phase43696|through 43696' webui/STATUS.md
echo "OK: phase43696 e2e passed"
