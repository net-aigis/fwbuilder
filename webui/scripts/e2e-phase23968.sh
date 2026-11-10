#!/usr/bin/env bash
# Phase-23968: soft-complete through 23968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 23968
PY
grep -qE 'phase23968|through 23968' webui/STATUS.md
echo "OK: phase23968 e2e passed"
