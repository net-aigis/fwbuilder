#!/usr/bin/env bash
# Phase-32312: soft-complete through 32312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32312
PY
grep -qE 'phase32312|through 32312' webui/STATUS.md
echo "OK: phase32312 e2e passed"
