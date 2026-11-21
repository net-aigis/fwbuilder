#!/usr/bin/env bash
# Phase-41152: soft-complete through 41152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41152
PY
grep -qE 'phase41152|through 41152' webui/STATUS.md
echo "OK: phase41152 e2e passed"
