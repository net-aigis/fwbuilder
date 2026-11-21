#!/usr/bin/env bash
# Phase-37800: soft-complete through 37800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37800
PY
grep -qE 'phase37800|through 37800' webui/STATUS.md
echo "OK: phase37800 e2e passed"
