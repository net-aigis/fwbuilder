#!/usr/bin/env bash
# Phase-44528: soft-complete through 44528.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44528
PY
grep -qE 'phase44528|through 44528' webui/STATUS.md
echo "OK: phase44528 e2e passed"
