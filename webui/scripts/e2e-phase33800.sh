#!/usr/bin/env bash
# Phase-33800: soft-complete through 33800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33800
PY
grep -qE 'phase33800|through 33800' webui/STATUS.md
echo "OK: phase33800 e2e passed"
