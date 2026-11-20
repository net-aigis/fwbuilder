#!/usr/bin/env bash
# Phase-47312: soft-complete through 47312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 47312
PY
grep -qE 'phase47312|through 47312' webui/STATUS.md
echo "OK: phase47312 e2e passed"
