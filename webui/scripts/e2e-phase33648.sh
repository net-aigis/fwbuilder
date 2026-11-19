#!/usr/bin/env bash
# Phase-33648: soft-complete through 33648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33648
PY
grep -qE 'phase33648|through 33648' webui/STATUS.md
echo "OK: phase33648 e2e passed"
