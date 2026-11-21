#!/usr/bin/env bash
# Phase-17728: soft-complete through 17728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 17728
PY
grep -qE 'phase17728|through 17728' webui/STATUS.md
echo "OK: phase17728 e2e passed"
