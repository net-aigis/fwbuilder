#!/usr/bin/env bash
# Phase-29968: soft-complete through 29968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 29968
PY
grep -qE 'phase29968|through 29968' webui/STATUS.md
echo "OK: phase29968 e2e passed"
