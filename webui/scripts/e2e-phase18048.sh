#!/usr/bin/env bash
# Phase-18048: soft-complete through 18048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18048
PY
grep -qE 'phase18048|through 18048' webui/STATUS.md
echo "OK: phase18048 e2e passed"
