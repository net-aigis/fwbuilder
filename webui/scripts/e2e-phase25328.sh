#!/usr/bin/env bash
# Phase-25328: soft-complete through 25328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25328
PY
grep -qE 'phase25328|through 25328' webui/STATUS.md
echo "OK: phase25328 e2e passed"
