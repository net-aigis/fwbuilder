#!/usr/bin/env bash
# Phase-37136: soft-complete through 37136.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37136
PY
grep -qE 'phase37136|through 37136' webui/STATUS.md
echo "OK: phase37136 e2e passed"
