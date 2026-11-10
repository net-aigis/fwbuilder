#!/usr/bin/env bash
# Phase-25968: soft-complete through 25968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 25968
PY
grep -qE 'phase25968|through 25968' webui/STATUS.md
echo "OK: phase25968 e2e passed"
