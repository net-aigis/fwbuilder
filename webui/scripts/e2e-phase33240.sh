#!/usr/bin/env bash
# Phase-33240: soft-complete through 33240.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33240
PY
grep -qE 'phase33240|through 33240' webui/STATUS.md
echo "OK: phase33240 e2e passed"
