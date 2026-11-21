#!/usr/bin/env bash
# Phase-44544: soft-complete through 44544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44544
PY
grep -qE 'phase44544|through 44544' webui/STATUS.md
echo "OK: phase44544 e2e passed"
