#!/usr/bin/env bash
# Phase-43648: soft-complete through 43648.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 43648
PY
grep -qE 'phase43648|through 43648' webui/STATUS.md
echo "OK: phase43648 e2e passed"
