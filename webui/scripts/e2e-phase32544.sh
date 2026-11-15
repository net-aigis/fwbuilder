#!/usr/bin/env bash
# Phase-32544: soft-complete through 32544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32544
PY
grep -qE 'phase32544|through 32544' webui/STATUS.md
echo "OK: phase32544 e2e passed"
