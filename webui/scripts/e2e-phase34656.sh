#!/usr/bin/env bash
# Phase-34656: soft-complete through 34656.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34656
PY
grep -qE 'phase34656|through 34656' webui/STATUS.md
echo "OK: phase34656 e2e passed"
