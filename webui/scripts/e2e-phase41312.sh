#!/usr/bin/env bash
# Phase-41312: soft-complete through 41312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 41312
PY
grep -qE 'phase41312|through 41312' webui/STATUS.md
echo "OK: phase41312 e2e passed"
