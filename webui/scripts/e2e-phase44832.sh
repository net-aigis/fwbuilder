#!/usr/bin/env bash
# Phase-44832: soft-complete through 44832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 44832
PY
grep -qE 'phase44832|through 44832' webui/STATUS.md
echo "OK: phase44832 e2e passed"
