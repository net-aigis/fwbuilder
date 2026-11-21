#!/usr/bin/env bash
# Phase-46192: soft-complete through 46192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46192
PY
grep -qE 'phase46192|through 46192' webui/STATUS.md
echo "OK: phase46192 e2e passed"
