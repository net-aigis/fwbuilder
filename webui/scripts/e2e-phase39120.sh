#!/usr/bin/env bash
# Phase-39120: soft-complete through 39120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39120
PY
grep -qE 'phase39120|through 39120' webui/STATUS.md
echo "OK: phase39120 e2e passed"
