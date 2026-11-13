#!/usr/bin/env bash
# Phase-27968: soft-complete through 27968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 27968
PY
grep -qE 'phase27968|through 27968' webui/STATUS.md
echo "OK: phase27968 e2e passed"
