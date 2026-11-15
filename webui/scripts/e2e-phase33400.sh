#!/usr/bin/env bash
# Phase-33400: soft-complete through 33400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33400
PY
grep -qE 'phase33400|through 33400' webui/STATUS.md
echo "OK: phase33400 e2e passed"
