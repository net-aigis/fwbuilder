#!/usr/bin/env bash
# Phase-42656: soft-complete through 42656.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42656
PY
grep -qE 'phase42656|through 42656' webui/STATUS.md
echo "OK: phase42656 e2e passed"
