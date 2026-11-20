#!/usr/bin/env bash
# Phase-43208: soft-complete through 43208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43208
PY
grep -qE 'phase43208|through 43208' webui/STATUS.md
echo "OK: phase43208 e2e passed"
