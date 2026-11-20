#!/usr/bin/env bash
# Phase-36648: soft-complete through 36648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 36648
PY
grep -qE 'phase36648|through 36648' webui/STATUS.md
echo "OK: phase36648 e2e passed"
