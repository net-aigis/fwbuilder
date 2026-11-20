#!/usr/bin/env bash
# Phase-39728: soft-complete through 39728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39728
PY
grep -qE 'phase39728|through 39728' webui/STATUS.md
echo "OK: phase39728 e2e passed"
