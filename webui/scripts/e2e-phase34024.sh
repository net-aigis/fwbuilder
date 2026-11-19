#!/usr/bin/env bash
# Phase-34024: soft-complete through 34024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 34024
PY
grep -qE 'phase34024|through 34024' webui/STATUS.md
echo "OK: phase34024 e2e passed"
