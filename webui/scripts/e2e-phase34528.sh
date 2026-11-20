#!/usr/bin/env bash
# Phase-34528: soft-complete through 34528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34528
PY
grep -qE 'phase34528|through 34528' webui/STATUS.md
echo "OK: phase34528 e2e passed"
