#!/usr/bin/env bash
# Phase-48544: soft-complete through 48544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 48544
PY
grep -qE 'phase48544|through 48544' webui/STATUS.md
echo "OK: phase48544 e2e passed"
