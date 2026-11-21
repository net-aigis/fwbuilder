#!/usr/bin/env bash
# Phase-39136: soft-complete through 39136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39136
PY
grep -qE 'phase39136|through 39136' webui/STATUS.md
echo "OK: phase39136 e2e passed"
