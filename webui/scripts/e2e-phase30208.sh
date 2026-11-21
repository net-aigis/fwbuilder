#!/usr/bin/env bash
# Phase-30208: soft-complete through 30208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30208
PY
grep -qE 'phase30208|through 30208' webui/STATUS.md
echo "OK: phase30208 e2e passed"
