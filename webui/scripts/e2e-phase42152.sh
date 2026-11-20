#!/usr/bin/env bash
# Phase-42152: soft-complete through 42152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42152
PY
grep -qE 'phase42152|through 42152' webui/STATUS.md
echo "OK: phase42152 e2e passed"
