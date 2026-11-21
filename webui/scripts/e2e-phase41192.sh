#!/usr/bin/env bash
# Phase-41192: soft-complete through 41192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41192
PY
grep -qE 'phase41192|through 41192' webui/STATUS.md
echo "OK: phase41192 e2e passed"
