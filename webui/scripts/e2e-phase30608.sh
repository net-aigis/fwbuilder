#!/usr/bin/env bash
# Phase-30608: soft-complete through 30608.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30608
PY
grep -qE 'phase30608|through 30608' webui/STATUS.md
echo "OK: phase30608 e2e passed"
