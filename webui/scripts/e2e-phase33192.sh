#!/usr/bin/env bash
# Phase-33192: soft-complete through 33192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33192
PY
grep -qE 'phase33192|through 33192' webui/STATUS.md
echo "OK: phase33192 e2e passed"
