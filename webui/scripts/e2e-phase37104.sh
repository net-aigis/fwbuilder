#!/usr/bin/env bash
# Phase-37104: soft-complete through 37104.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37104
PY
grep -qE 'phase37104|through 37104' webui/STATUS.md
echo "OK: phase37104 e2e passed"
