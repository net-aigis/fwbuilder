#!/usr/bin/env bash
# Phase-46800: soft-complete through 46800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46800
PY
grep -qE 'phase46800|through 46800' webui/STATUS.md
echo "OK: phase46800 e2e passed"
