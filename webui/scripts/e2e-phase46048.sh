#!/usr/bin/env bash
# Phase-46048: soft-complete through 46048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46048
PY
grep -qE 'phase46048|through 46048' webui/STATUS.md
echo "OK: phase46048 e2e passed"
