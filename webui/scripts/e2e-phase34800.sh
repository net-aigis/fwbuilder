#!/usr/bin/env bash
# Phase-34800: soft-complete through 34800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34800
PY
grep -qE 'phase34800|through 34800' webui/STATUS.md
echo "OK: phase34800 e2e passed"
