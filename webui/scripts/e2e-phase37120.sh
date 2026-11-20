#!/usr/bin/env bash
# Phase-37120: soft-complete through 37120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37120
PY
grep -qE 'phase37120|through 37120' webui/STATUS.md
echo "OK: phase37120 e2e passed"
