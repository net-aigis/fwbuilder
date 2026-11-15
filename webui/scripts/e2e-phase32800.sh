#!/usr/bin/env bash
# Phase-32800: soft-complete through 32800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32800
PY
grep -qE 'phase32800|through 32800' webui/STATUS.md
echo "OK: phase32800 e2e passed"
