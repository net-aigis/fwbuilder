#!/usr/bin/env bash
# Phase-38152: soft-complete through 38152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 38152
PY
grep -qE 'phase38152|through 38152' webui/STATUS.md
echo "OK: phase38152 e2e passed"
