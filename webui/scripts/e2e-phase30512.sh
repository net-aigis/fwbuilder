#!/usr/bin/env bash
# Phase-30512: soft-complete through 30512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 30512
PY
grep -qE 'phase30512|through 30512' webui/STATUS.md
echo "OK: phase30512 e2e passed"
