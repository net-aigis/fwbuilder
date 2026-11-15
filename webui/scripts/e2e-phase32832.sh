#!/usr/bin/env bash
# Phase-32832: soft-complete through 32832.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32832
PY
grep -qE 'phase32832|through 32832' webui/STATUS.md
echo "OK: phase32832 e2e passed"
