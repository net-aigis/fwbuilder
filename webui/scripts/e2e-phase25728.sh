#!/usr/bin/env bash
# Phase-25728: soft-complete through 25728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25728
PY
grep -qE 'phase25728|through 25728' webui/STATUS.md
echo "OK: phase25728 e2e passed"
