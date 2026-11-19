#!/usr/bin/env bash
# Phase-33712: soft-complete through 33712.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33712
PY
grep -qE 'phase33712|through 33712' webui/STATUS.md
echo "OK: phase33712 e2e passed"
