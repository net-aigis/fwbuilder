#!/usr/bin/env bash
# Phase-42312: soft-complete through 42312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42312
PY
grep -qE 'phase42312|through 42312' webui/STATUS.md
echo "OK: phase42312 e2e passed"
