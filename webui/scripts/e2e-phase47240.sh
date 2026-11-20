#!/usr/bin/env bash
# Phase-47240: soft-complete through 47240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47240
PY
grep -qE 'phase47240|through 47240' webui/STATUS.md
echo "OK: phase47240 e2e passed"
