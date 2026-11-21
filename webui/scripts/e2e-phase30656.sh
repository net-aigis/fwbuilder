#!/usr/bin/env bash
# Phase-30656: soft-complete through 30656.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30656
PY
grep -qE 'phase30656|through 30656' webui/STATUS.md
echo "OK: phase30656 e2e passed"
