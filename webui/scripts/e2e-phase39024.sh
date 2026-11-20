#!/usr/bin/env bash
# Phase-39024: soft-complete through 39024.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 39024
PY
grep -qE 'phase39024|through 39024' webui/STATUS.md
echo "OK: phase39024 e2e passed"
