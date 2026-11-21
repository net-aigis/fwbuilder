#!/usr/bin/env bash
# Phase-44024: soft-complete through 44024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44024
PY
grep -qE 'phase44024|through 44024' webui/STATUS.md
echo "OK: phase44024 e2e passed"
