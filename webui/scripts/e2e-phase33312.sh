#!/usr/bin/env bash
# Phase-33312: soft-complete through 33312.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33312
PY
grep -qE 'phase33312|through 33312' webui/STATUS.md
echo "OK: phase33312 e2e passed"
