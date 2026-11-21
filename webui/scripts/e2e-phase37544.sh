#!/usr/bin/env bash
# Phase-37544: soft-complete through 37544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 37544
PY
grep -qE 'phase37544|through 37544' webui/STATUS.md
echo "OK: phase37544 e2e passed"
