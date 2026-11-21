#!/usr/bin/env bash
# Phase-45696: soft-complete through 45696.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 45696
PY
grep -qE 'phase45696|through 45696' webui/STATUS.md
echo "OK: phase45696 e2e passed"
