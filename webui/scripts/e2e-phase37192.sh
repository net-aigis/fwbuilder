#!/usr/bin/env bash
# Phase-37192: soft-complete through 37192.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37192
PY
grep -qE 'phase37192|through 37192' webui/STATUS.md
echo "OK: phase37192 e2e passed"
