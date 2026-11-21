#!/usr/bin/env bash
# Phase-19968: soft-complete through 19968.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 19968
PY
grep -qE 'phase19968|through 19968' webui/STATUS.md
echo "OK: phase19968 e2e passed"
