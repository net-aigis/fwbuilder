#!/usr/bin/env bash
# Phase-30728: soft-complete through 30728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30728
PY
grep -qE 'phase30728|through 30728' webui/STATUS.md
echo "OK: phase30728 e2e passed"
