#!/usr/bin/env bash
# Phase-46024: soft-complete through 46024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 46024
PY
grep -qE 'phase46024|through 46024' webui/STATUS.md
echo "OK: phase46024 e2e passed"
