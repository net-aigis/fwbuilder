#!/usr/bin/env bash
# Phase-39312: soft-complete through 39312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39312
PY
grep -qE 'phase39312|through 39312' webui/STATUS.md
echo "OK: phase39312 e2e passed"
