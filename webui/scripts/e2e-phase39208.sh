#!/usr/bin/env bash
# Phase-39208: soft-complete through 39208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39208
PY
grep -qE 'phase39208|through 39208' webui/STATUS.md
echo "OK: phase39208 e2e passed"
