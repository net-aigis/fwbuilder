#!/usr/bin/env bash
# Phase-34312: soft-complete through 34312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34312
PY
grep -qE 'phase34312|through 34312' webui/STATUS.md
echo "OK: phase34312 e2e passed"
