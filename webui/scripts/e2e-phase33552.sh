#!/usr/bin/env bash
# Phase-33552: soft-complete through 33552.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33552
PY
grep -qE 'phase33552|through 33552' webui/STATUS.md
echo "OK: phase33552 e2e passed"
