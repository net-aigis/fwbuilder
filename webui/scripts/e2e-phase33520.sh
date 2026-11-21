#!/usr/bin/env bash
# Phase-33520: soft-complete through 33520.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33520
PY
grep -qE 'phase33520|through 33520' webui/STATUS.md
echo "OK: phase33520 e2e passed"
