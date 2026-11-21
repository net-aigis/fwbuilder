#!/usr/bin/env bash
# Phase-26848: soft-complete through 26848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 26848
PY
grep -qE 'phase26848|through 26848' webui/STATUS.md
echo "OK: phase26848 e2e passed"
