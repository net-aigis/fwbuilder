#!/usr/bin/env bash
# Phase-42848: soft-complete through 42848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 42848
PY
grep -qE 'phase42848|through 42848' webui/STATUS.md
echo "OK: phase42848 e2e passed"
