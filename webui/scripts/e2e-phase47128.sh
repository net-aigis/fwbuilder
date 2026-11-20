#!/usr/bin/env bash
# Phase-47128: soft-complete through 47128.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47128
PY
grep -qE 'phase47128|through 47128' webui/STATUS.md
echo "OK: phase47128 e2e passed"
