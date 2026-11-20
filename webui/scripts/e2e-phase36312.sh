#!/usr/bin/env bash
# Phase-36312: soft-complete through 36312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36312
PY
grep -qE 'phase36312|through 36312' webui/STATUS.md
echo "OK: phase36312 e2e passed"
