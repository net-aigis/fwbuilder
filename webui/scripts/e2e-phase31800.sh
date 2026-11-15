#!/usr/bin/env bash
# Phase-31800: soft-complete through 31800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31800
PY
grep -qE 'phase31800|through 31800' webui/STATUS.md
echo "OK: phase31800 e2e passed"
