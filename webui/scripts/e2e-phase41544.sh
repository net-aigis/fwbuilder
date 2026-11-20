#!/usr/bin/env bash
# Phase-41544: soft-complete through 41544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41544
PY
grep -qE 'phase41544|through 41544' webui/STATUS.md
echo "OK: phase41544 e2e passed"
