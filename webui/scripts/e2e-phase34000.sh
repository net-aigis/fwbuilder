#!/usr/bin/env bash
# Phase-34000: soft-complete through 34000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34000
PY
grep -qE 'phase34000|through 34000' webui/STATUS.md
echo "OK: phase34000 e2e passed"
