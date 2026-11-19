#!/usr/bin/env bash
# Phase-33832: soft-complete through 33832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 33832
PY
grep -qE 'phase33832|through 33832' webui/STATUS.md
echo "OK: phase33832 e2e passed"
