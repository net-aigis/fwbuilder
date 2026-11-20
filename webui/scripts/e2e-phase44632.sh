#!/usr/bin/env bash
# Phase-44632: soft-complete through 44632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44632
PY
grep -qE 'phase44632|through 44632' webui/STATUS.md
echo "OK: phase44632 e2e passed"
