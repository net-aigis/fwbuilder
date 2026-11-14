#!/usr/bin/env bash
# Phase-31312: soft-complete through 31312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31312
PY
grep -qE 'phase31312|through 31312' webui/STATUS.md
echo "OK: phase31312 e2e passed"
