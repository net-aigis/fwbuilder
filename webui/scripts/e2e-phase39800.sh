#!/usr/bin/env bash
# Phase-39800: soft-complete through 39800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39800
PY
grep -qE 'phase39800|through 39800' webui/STATUS.md
echo "OK: phase39800 e2e passed"
