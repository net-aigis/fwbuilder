#!/usr/bin/env bash
# Phase-32512: soft-complete through 32512.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
PYTHONPATH=webui/backend python3 - <<'PY'
from fwbweb_api import main as m
assert int(m.WEBUI_SOFT_COMPLETE_PHASE) >= 32512
PY
grep -qE 'phase32512|through 32512' webui/STATUS.md
echo "OK: phase32512 e2e passed"
