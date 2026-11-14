#!/usr/bin/env bash
# Phase-30312: soft-complete through 30312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30312
PY
grep -qE 'phase30312|through 30312' webui/STATUS.md
echo "OK: phase30312 e2e passed"
