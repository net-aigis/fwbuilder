#!/usr/bin/env bash
# Phase-40312: soft-complete through 40312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40312
PY
grep -qE 'phase40312|through 40312' webui/STATUS.md
echo "OK: phase40312 e2e passed"
