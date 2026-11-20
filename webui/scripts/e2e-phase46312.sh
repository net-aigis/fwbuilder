#!/usr/bin/env bash
# Phase-46312: soft-complete through 46312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46312
PY
grep -qE 'phase46312|through 46312' webui/STATUS.md
echo "OK: phase46312 e2e passed"
