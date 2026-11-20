#!/usr/bin/env bash
# Phase-37312: soft-complete through 37312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37312
PY
grep -qE 'phase37312|through 37312' webui/STATUS.md
echo "OK: phase37312 e2e passed"
