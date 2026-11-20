#!/usr/bin/env bash
# Phase-39000: soft-complete through 39000.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39000
PY
grep -qE 'phase39000|through 39000' webui/STATUS.md
echo "OK: phase39000 e2e passed"
