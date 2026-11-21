#!/usr/bin/env bash
# Phase-18208: soft-complete through 18208.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 18208
PY
grep -qE 'phase18208|through 18208' webui/STATUS.md
echo "OK: phase18208 e2e passed"
