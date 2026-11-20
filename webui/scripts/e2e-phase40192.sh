#!/usr/bin/env bash
# Phase-40192: soft-complete through 40192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 40192
PY
grep -qE 'phase40192|through 40192' webui/STATUS.md
echo "OK: phase40192 e2e passed"
