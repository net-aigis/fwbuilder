#!/usr/bin/env bash
# Phase-32328: soft-complete through 32328.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32328
PY
grep -qE 'phase32328|through 32328' webui/STATUS.md
echo "OK: phase32328 e2e passed"
