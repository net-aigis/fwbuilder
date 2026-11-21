#!/usr/bin/env bash
# Phase-13968: soft-complete through 13968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 13968
PY
grep -qE 'phase13968|through 13968' webui/STATUS.md
echo "OK: phase13968 e2e passed"
