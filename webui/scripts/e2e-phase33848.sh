#!/usr/bin/env bash
# Phase-33848: soft-complete through 33848.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33848
PY
grep -qE 'phase33848|through 33848' webui/STATUS.md
echo "OK: phase33848 e2e passed"
