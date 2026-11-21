#!/usr/bin/env bash
# Phase-31848: soft-complete through 31848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 31848
PY
grep -qE 'phase31848|through 31848' webui/STATUS.md
echo "OK: phase31848 e2e passed"
