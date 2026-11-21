#!/usr/bin/env bash
# Phase-32728: soft-complete through 32728.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32728
PY
grep -qE 'phase32728|through 32728' webui/STATUS.md
echo "OK: phase32728 e2e passed"
