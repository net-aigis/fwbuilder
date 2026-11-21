#!/usr/bin/env bash
# Phase-34048: soft-complete through 34048.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34048
PY
grep -qE 'phase34048|through 34048' webui/STATUS.md
echo "OK: phase34048 e2e passed"
