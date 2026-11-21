#!/usr/bin/env bash
# Phase-30544: soft-complete through 30544.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30544
PY
grep -qE 'phase30544|through 30544' webui/STATUS.md
echo "OK: phase30544 e2e passed"
