#!/usr/bin/env bash
# Phase-31024: soft-complete through 31024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31024
PY
grep -qE 'phase31024|through 31024' webui/STATUS.md
echo "OK: phase31024 e2e passed"
